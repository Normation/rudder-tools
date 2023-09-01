# Rudder Software Bill of Materials (SBOM)

This folder contains experimental tooling for generating SBOMs for Rudder releases.

## Scope

This script is able to generate CycloneDX SBOMs for Rudder (>= 7.3) including only (for now)
the dependencies from the following ecosystems:

* Scala/Java
* Rust
* JS
* F#

We exclude dev dependencies when possible, and try to focus on dependencies actually embedded into Rudder.

Currently missing ecosystems/languages are:

* Python
* Perl
* Elm
* C (curl, openssl, etc.)

## Usage

Run the script directly with the version you want to generate a SBOM for, it will download the source
and generate a `rudder-sbom-X.Y.Z.json.gz` files.

```shell
./sbom.sh 8.0.1
```

Note: `cargo-cyclonedx` produces error messages about licenses, looking link with `[2023-08-28T22:58:09Z ERROR cargo_cyclonedx::generator] Package ... has an invalid license expression, trying lax parsing...`. This can be safely ignored and is due to [a bug](https://github.com/CycloneDX/cyclonedx-rust-cargo/pull/363) not fixed yet.

## Dependencies

* mvn
* npm
* cargo
* cargo-cyclonedx
  * Install with `cargo install cargo-cyclonedx`
* cyclonedx-cli
  * Install from releases on [the repository](https://github.com/CycloneDX/cyclonedx-cli)
* cyclonedx-dotnet
  * Install with `dotnet tool install --global CycloneDX`