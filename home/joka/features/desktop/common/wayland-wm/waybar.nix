{ outputs, config, lib, pkgs, ... }:

let
  # Dependencies
  cat = "${pkgs.coreutils}/bin/cat";
  cut = "${pkgs.coreutils}/bin/cut";
  find = "${pkgs.findutils}/bin/find";
  grep = "${pkgs.gnugrep}/bin/grep";
  perl = "${pkgs.perl}/bin/perl";
  pgrep = "${pkgs.procps}/bin/pgrep";
  sed = "${pkgs.gnused}/bin/sed";
  tail = "${pkgs.coreutils}/bin/tail";
  wc = "${pkgs.coreutils}/bin/wc";
  xargs = "${pkgs.findutils}/bin/xargs";
  timeout = "${pkgs.coreutils}/bin/timeout";
  ping = "${pkgs.iputils}/bin/ping";

  jq = "${pkgs.jq}/bin/jq";
  xml = "${pkgs.xmlstarlet}/bin/xml";
  gamemoded = "${pkgs.gamemode}/bin/gamemoded";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  journalctl = "${pkgs.systemd}/bin/journalctl";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  playerctld = "${pkgs.playerctl}/bin/playerctld";
  neomutt = "${pkgs.neomutt}/bin/neomutt";
  pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
  btop = "${pkgs.bottom}/bin/btop";
  wofi = "${pkgs.wofi}/bin/wofi";
#  ikhal = "${pkgs.khal}/bin/ikhal";

  terminal = "${pkgs.kitty}/bin/kitty";
  terminal-spawn = cmd: "${terminal} $SHELL -i -c ${cmd}";

  #calendar = terminal-spawn ikhal;
  systemMonitor = terminal-spawn btop;
  mail = terminal-spawn neomutt;

  # Function to simplify making waybar outputs
  jsonOutput = name: { pre ? "", text ? "", tooltip ? "", alt ? "", class ? "", percentage ? "" }: "${pkgs.writeShellScriptBin "waybar-${name}" ''
    set -euo pipefail
    ${pre}
    ${jq} -cn \
      --arg text "${text}" \
      --arg tooltip "${tooltip}" \
      --arg alt "${alt}" \
      --arg class "${class}" \
      --arg percentage "${percentage}" \
      '{text:$text,tooltip:$tooltip,alt:$alt,class:$class,percentage:$percentage}'
  ''}/bin/waybar-${name}";

  hasSway = config.wayland.windowManager.sway.enable;
  sway = config.wayland.windowManager.sway.package;
  hasHyprland = config.wayland.windowManager.hyprland.enable;
  hyprland = config.wayland.windowManager.hyprland.package;
in
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
    });
    systemd.enable = true;
    settings = {
      # TODO: Remove this duplicity
      bottom-main = {
        layer = "top";
        height = 32;
        margin = "6";
        position = "bottom";
        output = builtins.map (m: m.name) (builtins.filter (m: ! m.noBar) config.monitors);
        modules-left = [
          "clock"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "idle_inhibitor"
          "tray"
        ];

        clock = {
          format = "{:%b %e %R %p}";
          #tooltip-format = ''
          #  <big>{:%Y %B}</big>
          #  <tt><small>{calendar}</small></tt>'';
          #on-click = calendar;
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
          persistent_workspaces = {
            "1" = ["eDP-1" "DP-1"];
            "2" = ["eDP-1" "DP-1"];
            "3" = ["eDP-1" "DP-1"];
            "4" = ["eDP-1" "DP-1"];
            "5" = ["eDP-1" "DP-1"];
            "6" = ["eDP-1" "DP-1"];
            "7" = ["eDP-1" "DP-1"];
            "8" = ["eDP-1" "DP-1"];
            "9" = ["eDP-1" "DP-1"];
            "10" = ["eDP-1" "DP-1"];

            "11" = ["DP-2" "HDMI-A-1"];
            "12" = ["DP-2" "HDMI-A-1"];
            "13" = ["DP-2" "HDMI-A-1"];
            "14" = ["DP-2" "HDMI-A-1"];
            "15" = ["DP-2" "HDMI-A-1"];
            "16" = ["DP-2" "HDMI-A-1"];
            "17" = ["DP-2" "HDMI-A-1"];
            "18" = ["DP-2" "HDMI-A-1"];
            "19" = ["DP-2" "HDMI-A-1"];
            "20" = ["DP-2" "HDMI-A-1"];
          };
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳";
            deactivated = "󰒲";
          };
        };
      };
      bottom = {
        layer = "top";
        height = 32;
        width = 100;
        margin = "6";
        position = "bottom";
        output = builtins.map (m: m.name) (builtins.filter (m: m.noBar) config.monitors);
        modules-center = [
          "hyprland/workspaces"
        ];
        "hyprland/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
          persistent_workspaces = {
            "1" = ["eDP-1" "DP-1"];
            "2" = ["eDP-1" "DP-1"];
            "3" = ["eDP-1" "DP-1"];
            "4" = ["eDP-1" "DP-1"];
            "5" = ["eDP-1" "DP-1"];
            "6" = ["eDP-1" "DP-1"];
            "7" = ["eDP-1" "DP-1"];
            "8" = ["eDP-1" "DP-1"];
            "9" = ["eDP-1" "DP-1"];
            "10" = ["eDP-1" "DP-1"];

            "11" = ["DP-2" "HDMI-A-1"];
            "12" = ["DP-2" "HDMI-A-1"];
            "13" = ["DP-2" "HDMI-A-1"];
            "14" = ["DP-2" "HDMI-A-1"];
            "15" = ["DP-2" "HDMI-A-1"];
            "16" = ["DP-2" "HDMI-A-1"];
            "17" = ["DP-2" "HDMI-A-1"];
            "18" = ["DP-2" "HDMI-A-1"];
            "19" = ["DP-2" "HDMI-A-1"];
            "20" = ["DP-2" "HDMI-A-1"];
          };
        };
      };

      primary = {
        layer = "top";
        height = 40;
        margin = "6";
        position = "top";
        output = builtins.map (m: m.name) (builtins.filter (m: ! m.noBar) config.monitors);
        modules-left = [
          "custom/menu"
          "custom/currentplayer"
          "custom/player"
        ];
        modules-center = [
          "cpu"
          "custom/gpu"
          "memory"
          "custom/gammastep"
          "custom/gpg-agent"
        ];
        modules-right = [
          "custom/gamemode"
          "pulseaudio"
          "network"
          "custom/tailscale-ping"
          "battery"
          "custom/hostname"
        ];
        cpu = {
          format = "󰘚  {usage}%";
          icon = "";
        };
        "custom/gpu" = {
          interval = 5;
          return-type = "json";
          exec = jsonOutput "gpu" {
            text = "$(${cat} /sys/class/drm/card0/device/gpu_busy_percent)";
            tooltip = "GPU Usage";
          };
          format = "󰢮  {}%";
        };
        memory = {
          format = "  {}%";
          interval = 5;
        };
        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "   0%";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋎";
            portable = "";
            default = [ "" "" "" ];
          };
          on-click = pavucontrol;
        };
        battery = {
          bat = "BAT0";
          interval = 10;
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          onclick = "";
        };
        "sway/window" = {
          max-length = 20;
        };
        network = {
          interval = 3;
          format-wifi = "   {essid}";
          format-ethernet = "󰈁 Connected";
          format-disconnected = "";
          tooltip-format = ''
            {ifname}
            {ipaddr}/{cidr}
            Up: {bandwidthUpBits}
            Down: {bandwidthDownBits}'';
          on-click = "";
        };
        "custom/tailscale-ping" = {
          interval = 2;
          return-type = "json";
          exec =
            let
              inherit (builtins) concatStringsSep attrNames;
              hosts = attrNames outputs.nixosConfigurations;
              homeMachine = "alcedo";
              remoteMachine = "falco";
            in
            jsonOutput "tailscale-ping" {
              # Build variables for each host
              pre = ''
                set -o pipefail
                ${concatStringsSep "\n" (map (host: ''
                  ping_${host}="$(${timeout} 2 ${ping} -c 1 -q ${host} 2>/dev/null | ${tail} -1 | ${cut} -d '/' -f5 | ${cut} -d '.' -f1)ms" || ping_${host}="Disconnected"
                '') hosts)}
              '';
              # Access a remote machine's and a home machine's ping
              text = "  $ping_${remoteMachine} /  $ping_${homeMachine}";
              # Show pings from all machines
              tooltip = concatStringsSep "\n" (map (host: "${host}: $ping_${host}") hosts);
            };
          format = "{}";
          on-click = "";
        };
        "custom/menu" = {
          return-type = "json";
          exec = jsonOutput "menu" {
            text = "";
            tooltip = ''$(${cat} /etc/os-release | ${grep} PRETTY_NAME | ${cut} -d '"' -f2)'';
          };
          on-click-left = "${wofi} -S drun -x 10 -y 10 -W 25% -H 60%";
          on-click-right = lib.concatStringsSep ";" (
            (lib.optional hasHyprland "${hyprland}/bin/hyprctl dispatch togglespecialworkspace") ++
            (lib.optional hasSway "${sway}/bin/swaymsg scratchpad show")
          );
        };
        "custom/hostname" = {
          exec = "echo $USER@$HOSTNAME";
          on-click = "${systemctl} --user restart waybar";
        };
        "custom/gpg-agent" = {
          interval = 2;
          return-type = "json";
          exec =
            let gpgCmds = import ../../../cli/gpg-commands.nix { inherit pkgs; };
            in
            jsonOutput "gpg-agent" {
              pre = ''status=$(${gpgCmds.isUnlocked} && echo "unlocked" || echo "locked")'';
              alt = "$status";
              tooltip = "GPG is $status";
            };
          format = "{icon}";
          format-icons = {
            "locked" = "";
            "unlocked" = "";
          };
          on-click = "";
        };
        "custom/gamemode" = {
          exec-if = "${gamemoded} --status | ${grep} 'is active' -q";
          interval = 2;
          return-type = "json";
          exec = jsonOutput "gamemode" {
            tooltip = "Gamemode is active";
          };
          format = " ";
        };
        "custom/gammastep" = {
          interval = 5;
          return-type = "json";
          exec = jsonOutput "gammastep" {
            pre = ''
              if unit_status="$(${systemctl} --user is-active gammastep)"; then
                status="$unit_status ($(${journalctl} --user -u gammastep.service -g 'Period: ' | ${tail} -1 | ${cut} -d ':' -f6 | ${xargs}))"
              else
                status="$unit_status"
              fi
            '';
            alt = "\${status:-inactive}";
            tooltip = "Gammastep is $status";
          };
          format = "{icon}";
          format-icons = {
            "activating" = "󰁪 ";
            "deactivating" = "󰁪 ";
            "inactive" = "? ";
            "active (Night)" = " ";
            "active (Nighttime)" = " ";
            "active (Transition (Night)" = " ";
            "active (Transition (Nighttime)" = " ";
            "active (Day)" = " ";
            "active (Daytime)" = " ";
            "active (Transition (Day)" = " ";
            "active (Transition (Daytime)" = " ";
          };
          on-click = "${systemctl} --user is-active gammastep && ${systemctl} --user stop gammastep || ${systemctl} --user start gammastep";
        };
        "custom/currentplayer" = {
          interval = 2;
          return-type = "json";
          exec = jsonOutput "currentplayer" {
            pre = ''
              player="$(${playerctl} status -f "{{playerName}}" 2>/dev/null || echo "No player active" | ${cut} -d '.' -f1)"
              count="$(${playerctl} -l | ${wc} -l)"
              if ((count > 1)); then
                more=" +$((count - 1))"
              else
                more=""
              fi
            '';
            alt = "$player";
            tooltip = "$player ($count available)";
            text = "$more";
          };
          format = "{icon}{}";
          format-icons = {
            "No player active" = " ";
            "Celluloid" = "󰎁 ";
            "spotify" = " 󰓇";
            "ncspot" = " 󰓇";
            "qutebrowser" = "󰖟";
            "firefox" = " ";
            "discord" = " 󰙯 ";
            "sublimemusic" = " ";
            "kdeconnect" = "󰄡 ";
          };
          on-click = "${playerctld} shift";
          on-click-right = "${playerctld} unshift";
        };
        "custom/player" = {
          exec-if = "${playerctl} status";
          exec = ''${playerctl} metadata --format '{"text": "{{artist}} - {{title}}", "alt": "{{status}}", "tooltip": "{{title}} ({{artist}} - {{album}})"}' '';
          return-type = "json";
          interval = 2;
          max-length = 30;
          format = "{icon} {}";
          format-icons = {
            "Playing" = "󰐊";
            "Paused" = "󰏤 ";
            "Stopped" = "󰓛";
          };
          on-click = "${playerctl} play-pause";
        };
      };

    };
    # Cheatsheet:
    # x -> all sides
    # x y -> vertical, horizontal
    # x y z -> top, horizontal, bottom
    # w x y z -> top, right, bottom, left
    style = let inherit (config.colorscheme) colors; in /* css */ ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
        font-size: 12pt;
        padding: 0 8px;
      }

      .modules-right {
        margin-right: -15px;
      }

      .modules-left {
        margin-left: -15px;
      }

      window#waybar.top {
        opacity: 0.95;
        padding: 0;
        background: transparent;
        border: 2px solid #${colors.base0B};
        border-radius: 10px;
      }
      window#waybar.bottom {
        background: transparent;
      }

      window#waybar {
        background: transparent;
        color: #${colors.base05};
      }

      #workspaces {
        opacity: 0.90;
        border: 2px solid #${colors.base0B};
        border-radius: 10px;
        background: transparent;
      }

      #workspaces button {
        color: #${colors.base05};
        margin: 4px;
      }
      #workspaces button.hidden {
        background-color: #${colors.base00};
        color: #${colors.base04};
      }
      #workspaces button.focused,
      #workspaces button.active {
        background-color: #${colors.base0B};
        color: #${colors.base00};
      }

      #clock {
        padding-left: 15px;
        padding-right: 15px;
        margin-top: 0;
        margin-bottom: 0;
        border-radius: 10px;
      }

      #custom-menu {
        background-color: #${colors.base0B};
        color: #${colors.base00};
        padding-left: 15px;
        padding-right: 22px;
        margin-left: 0;
        margin-right: 10px;
        margin-top: 0;
        margin-bottom: 0;
        border-radius: 10px;
      }
      #custom-hostname {
        background-color: #${colors.base0B};
        color: #${colors.base00};
        padding-left: 15px;
        padding-right: 18px;
        margin-right: 0;
        margin-top: 0;
        margin-bottom: 0;
        border-radius: 10px;
      }
      #tray {
        color: #${colors.base05};
      }
    '';
  };
}
