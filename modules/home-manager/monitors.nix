{ lib, config, ... }:

let
  inherit (lib) mkOption types;
  cfg = config.monitors;
in
{
  options.monitors = mkOption {
    type = types.listOf (types.submodule {
      options = {
        name = mkOption {
          type = types.str;
          example = "DP-1";
        };
        noBar = mkOption {
          type = types.bool;
          default = false;
        };
        width = mkOption {
          type = types.int;
          example = 1920;
        };
        height = mkOption {
          type = types.int;
          example = 1080;
        };
        refreshRate = mkOption {
          type = types.int;
          default = 60;
        };
        primary = mkOption {
          type = types.bool;
          default = false;
        
        };
        x = mkOption {
          type = types.int;
          default = 0;
        };
        y = mkOption {
          type = types.int;
          default = 0;
        };
        enabled = mkOption {
          type = types.bool;
          default = true;
        };
      };
    });
  };
  config = {
    assertions = [{
	assertion = (lib.length (lib.filter (m: m.primary) config.monitors)) == 1;
	message = "Exactly one monitor must be set to primary";
    }];
  };
  options.workspaces = mkOption {
    type = types.listOf (types.submodule {
      options = {
        id = mkOption {
          type = types.int;
          example = 1;
        };
        name = mkOption {
          type = types.nullOr types.str;
          example = "My workspace 1";
        };
        monitor = mkOption {
          type = types.str;
          example = "DP-1";
        };
        default = mkOption {
          type = types.bool;
          default = false;
        };
        enabled = mkOption {
          type = types.bool;
          default = true;
        };
      };
    });
  };
}
