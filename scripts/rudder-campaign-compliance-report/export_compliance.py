# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2026 Normation SAS

#!/usr/bin/env python3
import math
import requests
import urllib3
import yaml
import subprocess
import shutil
from datetime import datetime, timedelta, UTC

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def load_config():
    # Load script configuration from config.yaml
    with open("config.yaml") as f:
        return yaml.safe_load(f)


def api_get(config, endpoint):
    # Send a GET request to Rudder API
    url = f"{config['rudder']['url']}/rudder/api/latest/{endpoint}"

    headers = {
        "X-API-Token": config["rudder"]["token"]
    }

    verify_ssl = config["rudder"].get("verify_ssl", True)

    response = requests.get(
        url,
        headers=headers,
        verify=verify_ssl
    )

    response.raise_for_status()
    return response.json()



def format_datetime(dt_str):
    # Convert Rudder UTC timestamp into readable format
    dt = datetime.fromisoformat(dt_str.replace("Z", "+00:00"))
    return dt.strftime("%Y-%m-%d %H:%M UTC")


def get_global_compliance(config):
    # Get global compliance percentage without decimals
    data = api_get(config, "compliance?precision=2")
    return data["data"]["globalCompliance"]["compliance"]


def get_non_compliant_nodes(config):
    # Return node(s) with compliance below 100%
    compliance_data = api_get(config, "compliance/nodes?level=1&precision=2")
    inventory_data = api_get(config, "nodes")

    # Add mapping UUID to hostname
    id_to_hostname = {
        node["id"]: node["hostname"]
        for node in inventory_data["data"]["nodes"]
    }

    failed_nodes = []

    for node in compliance_data["data"]["nodes"]:
        # Browse node in Rudder
        compliance = node.get("compliance")
        compliance_details = node.get("complianceDetails", {})
        hostname = id_to_hostname.get(node["id"], node["id"])

         # If no reports received from the node
        if (
            compliance == 0.0
            and compliance_details.get("noReport") == 100.0
        ):
            failed_nodes.append({
                "hostname": hostname,
                "compliance": "Unknown"
            })
            continue

        if compliance is None:
            continue

        display_compliance = round(compliance)

        # Skip real compliant nodes 100%
        if display_compliance >= 100:
            continue

        failed_nodes.append({
            "hostname": hostname,
            "compliance": display_compliance
        })

    return failed_nodes


def get_last_two_days_campaign_events(config):
    # Get finished campaigns from last two days
    last_two_days = datetime.now(UTC) - timedelta(days=1)

    start = last_two_days.strftime("%Y-%m-%dT00:00:00Z")
    end = last_two_days.strftime("%Y-%m-%dT23:59:59Z")

    data = api_get(
        config,
        f"campaigns/events?after={start}&before={end}&state=finished"
    )

    return data["data"]["campaignEvents"]


def get_node_hostname(config, node_id):
    # Resolve node UUID to hostname
    data = api_get(config, f"nodes/{node_id}")
    return data["data"]["nodes"][0]["hostname"]


def get_patch_campaign_status(config):
     # Get per-campaign patch results
    events = get_last_two_days_campaign_events(config)
    reports = []

    for event in events:
         # Only system update campaigns show result details
        if event["campaignType"] != "system-update":
            continue

        event_id = event["id"]
        event_name = event["name"]
        event_start = format_datetime(event["start"])
        event_end = format_datetime(event["end"])

        # Get detailed execution result for this campaign event
        data = api_get(
            config,
            f"systemUpdate/events/{event_id}/result"
        )

        event_results = data["data"]["eventResult"]

        # Some campaigns may exist but have no usable result yet
        if not event_results:
            continue

        success_nodes = []
        failed_nodes = []
        missing_nodes = []

        # eventResult contains node execution status for the campaign run
        for node in event_results[0]["nodes"]:
            status = node["status"]
            hostname = get_node_hostname(config, node["nodeId"])

            if status == "success":
                success_nodes.append(hostname)

            elif status in ["error", "failed"]:
                failed_nodes.append(hostname)

            elif status == "missing":
                missing_nodes.append(hostname)

        # Store one summary block per campaign
        reports.append({
            "event_name": event_name,
            "event_start": event_start,
            "event_end": event_end,
            "success_count": len(success_nodes),
            "failed_count": len(failed_nodes),
            "missing_count": len(missing_nodes),
            "failed_nodes": failed_nodes,
            "missing_nodes": missing_nodes
        })

    return reports


def build_report(config):
    # Build final email report
    compliance = get_global_compliance(config)
    non_compliant = get_non_compliant_nodes(config)
    patch_reports = get_patch_campaign_status(config)

    lines = []

    lines.append(f"Global compliance: {compliance}%")
    lines.append("")

    lines.append("Non-compliant nodes (<100%):")

    if non_compliant:
        for node in non_compliant:
            if node["compliance"] == "Unknown":
                lines.append(f"- {node['hostname']} (Unknown)")
            else:
                lines.append(
                    f"- {node['hostname']} ({node['compliance']}%)"
                )
    else:
        lines.append("All nodes are fully compliant.")

    lines.append("")
    lines.append("System update campaigns executed in the last two days:")

    if patch_reports:
        for report in patch_reports:
            lines.append("")
            lines.append(
                f"{report['event_name']} "
                f"[{report['event_start']} → {report['event_end']}]"
            )
            lines.append(f"Success nodes: {report['success_count']}")
            lines.append(f"Failed nodes: {report['failed_count']}")
            lines.append(f"Missing nodes: {report['missing_count']}")

            if report["failed_nodes"]:
                lines.append("Failed patch nodes:")
                for node in report["failed_nodes"]:
                    lines.append(f"- {node}")

            if report["missing_nodes"]:
                lines.append("Missing patch nodes:")
                for node in report["missing_nodes"]:
                    lines.append(f"- {node}")
    else:
        lines.append("No system update campaign executed in the last two day.")

    return "\n".join(lines)


def send_mail(config, report):
    # Send report with GNU mail
    if not shutil.which("mail"):
        raise RuntimeError("mail command not found")

    cmd = [
        "mail",
        "-a",
        f"From: {config['mail']['from']}",
        "-s",
        "Rudder Compliance Report",
        *config["mail"]["to"]
    ]

    subprocess.run(
        cmd,
        input=report,
        text=True,
        check=True
    )


def main():
    config = load_config()

    report = build_report(config)

    print(report)

    send_mail(config, report)


if __name__ == "__main__":
    main()
