{
  description = "rudder-tools Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, ... }@inputs:

    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import inputs.nixpkgs {
              inherit system;
            };
          }
        );
    in
    {
      packages = forEachSupportedSystem (
        { pkgs }:
        rec {
          rudder-dev = pkgs.stdenv.mkDerivation rec {
            name = "rudder-dev";
            src = ./scripts/rudder-dev;
            phases = [
              "buildPhase"
              "patchPhase"
              "fixupPhase"
            ];
            nativeBuildInputs = with pkgs; [ perl ];
            propagatedBuildInputs = [ (pkgs.python3.withPackages passthru.pythondeps) ];
            passthru.pythondeps =
              python-pkgs: with python-pkgs; [
                python-dateutil
                docopt
                requests
              ];
            buildPhase = ''
              mkdir -p $out/bin
              mkdir -p $out/etc
              cd $(mktemp -d)
              cp $src/Makefile $src/rudder-dev-src $src/*.py .
              make
              cp rudder-dev $out/bin/rudder-dev
              rm -r $(pwd) && cd $OLDPWD
              chmod 755 $out/bin/rudder-dev
            '';
            # make XDG compliant config and cache file, and static configuration in store
            preFixup = ''
              substituteInPlace $out/bin/rudder-dev \
                --replace-fail "CONFIG_FILE = " "CONFIG_FILE = os.path.join(os.environ.get('XDG_CONFIG_HOME', os.path.expanduser('~/.config')), 'rudder-dev', 'rudder-dev.conf') #"\
                --replace-fail "CACHE_FILE = " "CACHE_FILE = os.path.join(os.environ.get('XDG_STATE_HOME', os.path.expanduser('~/.local/state')), 'rudder-dev', 'rudder-dev.cache') #"
            '';
            # or else there is a "find: bad -printf %D" error
            # dontStrip = true;
          };
          default = rudder-dev;
        }
      );
    };
}
