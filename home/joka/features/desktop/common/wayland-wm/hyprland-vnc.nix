{ pkgs, lib, config, ... }:
let
  enabledMonitors = lib.filter (m: m.enabled) config.monitors;
  enabledWorkspaces = lib.filter (w: w.enabled) config.workspaces;
  # A nice VNC script for remotes running hyprland
  vncsh = pkgs.writeShellScriptBin "vnc.sh" ''
    ssh $1 bash <<'EOF'
        pgrep "wayvnc" && exit
        export HYPRLAND_INSTANCE_SIGNATURE="$(ls /tmp/hypr/ -lt | head -2 | tail -1 | rev | cut -d ' ' -f1 | rev)"
        export WAYLAND_DISPLAY="wayland-1"
        ip="$(ip addr show dev tailscale0 | grep 'inet ' | xargs | cut -d ' ' -f2 | cut -d '/' -f1)"
        xpos="$(hyprctl monitors -j | jq -r 'sort_by(.x)[-1] | .x + .width')"

        ${lib.concatLines (lib.forEach enabledMonitors (m: 
        let 
          monitorWorkspaces = lib.filter (d: d.monitor == m.name) enabledWorkspaces;
        in
        ''
          hyprctl output create headless
          monitor="$(hyprctl monitors -j | jq -r 'map(.name)[-1]')"
          hyprctl keyword monitor $monitor,${toString m.width}x${toString m.height}@${toString m.refreshRate},$(($xpos + ${toString m.x}))x${toString m.y},1
          ${lib.concatLines (lib.forEach monitorWorkspaces (w: 
          ''
          screen -d -m wayvnc -k br -S /tmp/vnc-${toString w.id} -f 60 -o $monitor $ip 590${toString w.id}
          sudo iptables -I INPUT -j ACCEPT -p tcp --dport 590${toString w.id}
          ''
          ))}
   
        ''))}
    EOF

    ${lib.concatLines (lib.forEach enabledWorkspaces (w: ''
      vncviewer $1::590${toString w.id} &
    ''))}

    wait
  '';
in
{
  home.packages = with pkgs; [
    vncsh
    wayvnc
    tigervnc
  ];
}