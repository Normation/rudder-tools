from __future__ import print_function
import sys
import requests

# trick to make fake import compatible with regular import
if 'Config' not in vars():
  from common import *  
    
Config.REDMINE_ALT_API_URL = "https://redmine.normation.com"
Config.REDMINE_API_URL = "https://www.rudder-project.org/redmine"
Config.REDMINE_API_LIMIT = 100
Config.REDMINE_CLOSED_STATUSES = [5, 6, 16, 11] # 5=Released, 6=rejected, 16=resolved, 11=Pending release
Config.REDMINE_META_TRACKERS = [3]
Config.ACCESS_ROLE_LIST = [ 3, 4, 5, 6, 7, 8, 9, 11 ] # 7=Product owner, 3=Scrum master, 8=Lead developer, 4=Developer, 5=Reporter, 11=Release manager, 6=Consultant, 9=Integrator

Config.REDMINE_NRM_GROUP = 314
Config.REDMINE_ALT_NRM_GROUP = 36

# Keeping old version for reference
#TRACKER_NAME_MAPPING = { 'Bug': 'bug', 'Implementation (development)': 'dev', 'Implementation (integration)': 'int' }
Config.TRACKER_NAME_MAPPING = { 'Bug': 'bug', 'User story': 'ust', 'Architecture': 'arch', 'Change': 'chg', 'Problem': 'pbm', 'Incident': 'inc' }
Config.PENDING_TR_CODE = 3
Config.IN_PROGRESS_CODE = 9
Config.CUSTOM_FIELD_PR = 3
Config.ALT_CUSTOM_FIELD_PR = 1
Config.BUG_TACKER_ID = 1
Config.PENDING_MERGE_CODE = 12
Config.DISCUSSION_CODE = 4

class Issue:
  """Class to hold informations about a single issue"""
  def __init__(self, name, must_be_open=True):
    """name is a string like: 1234 or i1234"""
    self.must_be_open = must_be_open
    self.info = None
    if name.startswith('#'):
      name = name [1:]
    self.name = name
    is_internal = re.match(r'i(\d+)', name)
    if is_internal:
      self.id = int(is_internal.group(1))
      self.token = Config.REDMINE_ALT_TOKEN
      self.api_url = Config.REDMINE_ALT_API_URL
      self.custom_field_pr = Config.ALT_CUSTOM_FIELD_PR
      self.internal = True
    else:
      self.id = int(name)
      self.token = Config.REDMINE_TOKEN
      self.api_url = Config.REDMINE_API_URL
      self.custom_field_pr = Config.CUSTOM_FIELD_PR
      self.internal = False
    self.server = Redmine(self.internal)

  def __getitem__(self, key):
    """Make Issue behave like a dict"""
    self._get_info()
    if key not in self.info:
      return None
    return self.info[key]

  def __contains__(self, key):
    """Make Issue behave like a dict"""
    self._get_info()
    return key in self.info

  def _get_version(self, issue_info, error_fail=True):
    """Extract a friendly version from an issue information"""
    if 'fixed_version' not in issue_info:
      if error_fail:
        logfail("***** BUG: Can't extract version from #" + self.name)
        exit(2)
      else:
        return None
    detector = get_lifecycle()['redmine_version']
    for k,v in detector:
      if re.match(k, issue_info['fixed_version']['name']):
        return (issue_info['fixed_version']['id'], re.sub(k, v, issue_info['fixed_version']['name']))
    if error_fail:
      logfail("***** BUG: Can't extract version from " + issue_info['fixed_version']['name'] + " in #" + self.name)
      exit(2)
    else:
      return None

  def _get_info(self):
    """Get issue informations from redmine"""
    if self.info is not None:
      return self.info
    # Find issue in redmine
    print("Looking for Redmine ticket #" + self.name + "... ", end=' ')
    sys.stdout.flush() # to display previous unfinished line
    issues_req = requests.get(self.api_url + "/issues/" + str(self.id) + ".json?include=journals",
                              headers = {'X-Redmine-API-Key': self.token, 'Content-Type': 'application/json' })
    issue = issues_req.json()['issue'] if issues_req.status_code == requests.codes.ok else None
    if not issue:
      print("Not found!")
      logfail("***** ERROR: ticket not found. Exiting.")
      if not Config.force:
        exit(2)
    else:
      print("Done")

    # Check ticket type
    if issue['tracker'] in Config.REDMINE_META_TRACKERS:
      print("This is a question ticket! You cannot make a pull request on this ticket.")
      logfail("***** ERROR: This is a question ticket. Exiting.")
      if not Config.force:
        exit(2)

    # Check ticket status
    if self.must_be_open and issue['status']['id'] in Config.REDMINE_CLOSED_STATUSES:
      print("This ticket is closed! You cannot make a pull request on this ticket.")
      logfail("***** ERROR: Closed ticket. Exiting.")
      if not Config.force:
        exit(2)

    if 'fixed_version' not in issue:
      print("This ticket has no target version! I can't make a branch against its repository.")
      logfail("***** ERROR: Missing target version. Exiting.")
      if not Config.force:
        exit(2)

    self.data = issue

    # Get ticket elements
    info = {}
    info['type'] = issue['tracker']['name']
    info['name'] = issue['subject']
    (info['version_id'],info['version']) = self._get_version(issue)
    info['project_id'] = issue['project']['id']
    info['tracker_id'] = issue['tracker']['id']
    info['priority_id'] = issue['priority']['id']
    info['subject'] = issue['subject']
    info['description'] = issue['description']
    info['private'] = 'is_private' in issue and issue['is_private']
    if 'category' in issue:
      info['category_id'] = issue['category']['id']
    if 'is_private' in issue:
      info['is_private'] = issue['is_private']
    if 'custom_fields' in issue:
      for field in issue['custom_fields']:
        if field['id'] == self.custom_field_pr and 'value' in field and field['value'] is not None and field['value'] != '':
          info['pr'] = field['value']

    # Get ticket's last assignment besides me
    my_id = get_redmine_uid()
    if 'journals' in issue:
      for journal in issue['journals']:
        if 'details' in journal:
          for detail in journal['details']:
            if detail['name'] == 'assigned_to_id' and 'old_value' in detail and detail['old_value'] is not None and detail['old_value'] != '':
              if int(detail['old_value']) != my_id:
                info['last_assignee'] = int(detail['old_value'])

    self.info = info
    return info

  def branch_name(self):
    """Create a branch name base on this issue"""
    branchified_name = re.sub("__+", "_", re.sub("[^" + string.ascii_letters + string.digits + "]", "_", self['name'].strip().lower())).strip("_")
    if self.internal:
      id = 'i' + str(self.id)
    else:
      id = str(self.id)
    if self['private']:
      branch_name = Config.TRACKER_NAME_MAPPING[self['type']] + "_" + id + "/_"
    else:
      branch_name = Config.TRACKER_NAME_MAPPING[self['type']] + "_" + id + "/" + branchified_name
    return branch_name

  # Beware, we don't update in memory status, throw away 'self' after calling this
  def _update_issue(self, change, message=None, alt_message=None):
    """Change the ticket content if possible"""
    if Config.REDMINE_TOKEN is None:
      return False
    # prepare info
    if self.server.can_modify_issues(self['project_id']):
      info = { 'issue': change }
      if message is not None:
        info['issue']['notes'] = message
    else:
      if alt_message is None:
        print("Cannot update the issue, you should update it manually status here " + self.api_url + "/issues/" + str(issue.id))
        return False
      info = { 'issue': { 'notes': alt_message } }

    # send info
    url = self.api_url + "/issues/" + str(self.id) + ".json"
    ret = requests.put(url, headers = {'X-Redmine-API-Key': self.token, 'Content-Type': 'application/json' }, data=json.dumps(info) )
    if ret.status_code != 200:
      logfail("Issue Update error: " + ret.reason)
      print(ret.text)
      if not Config.force:
        exit(3)
    return True

  def update(self, user_id=None, pr_url=None, message=None, status=None):
    """Change ticket state and comment it"""
    # Create note content
    note = None
    if pr_url is not None:
      note = "PR " + pr_url
    if message is not None:
      if note is None:
        note = message
      else:
        note += "\n" + message
  
    change = {}
    # fill ticket data with developer available content
    if status is not None:
      change['status_id'] = status
    if user_id is not None:
      change['assigned_to_id'] = user_id
    if note is not None:
      change['notes'] = note
    if pr_url is not None:
      change['custom_fields'] = [ { 'id': self.custom_field_pr, 'value': pr_url } ]
  
    self._update_issue(change, message, message)

  def to_in_progress(self, message=None):
    """Change the ticket state to In progress"""
    change = {
            'status_id': Config.IN_PROGRESS_CODE,
            }
    if Config.REDMINE_TOKEN is not None:
      change['assigned_to_id'] = get_redmine_uid()
    self._update_issue(change, message)

  def to_status(self, status, assign_to, message=None):
    """Change the ticket state to pending_merge"""
    change = {
            'status_id': status,
            'assigned_to_id': assign_to,
            }
    self._update_issue(change, message)

  def clone(self, version_id, new_title, bug=False):
    """Clone this issue making the new one a child of this one"""
    self._get_info()
    new_info = {}
    for i in ('project_id', 'tracker_id', 'priority_id', 'subject', 'description', 'category_id', 'fixed_version_id', 'is_private'):
      if i in self.info:
        new_info[i] = self.info[i]
    new_info['parent_issue_id'] = self.id
    if bug:
      new_info['tracker_id'] = Config.BUG_TACKER_ID
      new_info['description'] = "There was a bug in the resolution of #" + str(self.id)
    if new_title is not None:
      if new_title.startswith('+'):
        new_info['subject'] += new_title.replace('+', ' ', 1)
      else:
        new_info['subject'] = new_title
    new_info['fixed_version_id'] = version_id
    return self.server._create_issue(new_info)

  def url(self):
    return self.api_url+"/issues/"+str(self.id)


class Redmine:
  """Class to query a redmine server"""
  def __init__(self, internal):
    self.internal = internal
    self.can_modify = None
    if internal:
      self.token = Config.REDMINE_ALT_TOKEN
      self.api_url = Config.REDMINE_ALT_API_URL
      self.nrm_group = Config.REDMINE_ALT_NRM_GROUP
    else:
      self.token = Config.REDMINE_TOKEN
      self.api_url = Config.REDMINE_API_URL
      self.nrm_group = Config.REDMINE_NRM_GROUP

  def _query(self, query, post_data=None):
    if post_data is None:
      ret = requests.get(self.api_url + query, headers = {'X-Redmine-API-Key': self.token })
    else:
      ret = requests.post(self.api_url + query, headers = {'X-Redmine-API-Key': self.token, 'Content-Type': 'application/json' }, data = post_data)
    return ret

  def create_issue(self, project_id, subject, description, tracker_id, version_id):
    new_info = { 'project_id': project_id, 'description': description, 'subject': subject, 
                 'fixed_version_id': version_id, 'tracker_id': tracker_id }
    return self._create_issue(new_info)

  def _create_issue(self, new_info):
    ticket_json = json.dumps({ 'issue': new_info })
    ret = self._query("/issues.json", ticket_json)
    if ret.status_code != 201:
      logfail("Issue creation error: " + ret.reason + "\n" + ret.text)
      if not Config.force:
        exit(3)
    if self.internal:
      new_id = 'i' + str(ret.json()['issue']['id'])
    else:
      new_id = str(ret.json()['issue']['id'])
    return Issue(new_id)

  # Return true if the current user can modify an issue in the given project
  def can_modify_issues(self, project_id):
    if self.can_modify is not None:
      return self.can_modify
    user = self._query("/users/current.json?include=memberships").json()
    for membership in user['user']['memberships']:
      if membership['project']['id'] == project_id:
        for role in membership['roles']:
          if role['id'] in Config.ACCESS_ROLE_LIST:
            self.can_modify = True
            return True
    self.can_modify = False
    return False
  
  def list_nrm_users(self):
    return self._query("/users.json?group_id=" + str(self.nrm_group))['users']


def issue_from_branch(branch):
  """Create issue object from given branch"""
  match = re.match(r'[A-Za-z]+_(i?\d+)/.*', branch)
  if match:
    return Issue(match.group(1))
  else:
    logfail("***** ERROR: This is not a ticket branch: " + branch)
    exit(4)

