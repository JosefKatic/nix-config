{ home, colorscheme, wallpaper }:
let
  inherit (home.sessionVariables) TERMINAL BROWSER EDITOR;
in
''
  general {
    gaps_in=15
    gaps_out=20
    border_size=2.7
    col.active_border=0xff${colorscheme.colors.base0C}
    col.inactive_border=0xff${colorscheme.colors.base02}
    col.group_border_active=0xff${colorscheme.colors.base0B}
    col.group_border=0xff${colorscheme.colors.base04}
  }
  decoration {
    active_opacity=0.94
    inactive_opacity=0.84
    fullscreen_opacity=1.0
    rounding=5
    blur=true
    blur_size=5
    blur_passes=3
    blur_new_optimizations=true
    blur_ignore_opacity=true
    drop_shadow=true
    shadow_range=12
    shadow_offset=3 3
    col.shadow=0x44000000
    col.shadow_inactive=0x66000000
  }
  animations {
    enabled=true
    bezier=easein,0.11, 0, 0.5, 0
    bezier=easeout,0.5, 1, 0.89, 1
    bezier=easeinout,0.45, 0, 0.55, 1
    animation=windowsIn,1,3,easeout,slide
    animation=windowsOut,1,3,easein,slide
    animation=windowsMove,1,3,easeout
    animation=fadeIn,1,3,easeout
    animation=fadeOut,1,3,easein
    animation=fadeSwitch,1,3,easeout
    animation=fadeShadow,1,3,easeout
    animation=fadeDim,1,3,easeout
    animation=border,1,3,easeout
    animation=workspaces,1,2,easeout,slide
  }
  dwindle {
    split_width_multiplier=1.35
  }
  misc {
    vfr=on
  }
  input {
    kb_layout=cz
    kb_variant=coder
    kb_model =
    numlock_by_default = true
  }
  # Passthrough mode (e.g. for VNC)
  bind=SUPER,P,submap,passthrough
  submap=passthrough
  bind=SUPER,P,submap,reset
  submap=reset
  # Startup
  exec-once=waybar
  exec=swaybg -i ${wallpaper} --mode fill
  exec-once=mako
  exec-once=swayidle -w
  # Mouse binding
  bindm=SUPER,mouse:272,movewindow
  bindm=SUPER,mouse:273,resizewindow
  # Program bindings
  bind=SUPER,q,exec,${TERMINAL}
  bind=SUPER,w,exec,makoctl dismiss
  bind=SUPER,v,exec,${TERMINAL} $SHELL -ic ${EDITOR}
  bind=SUPER,c,exec,code
  bind=SUPER,b,exec,${BROWSER}
  bind=SUPER,a,exec,wofi -S drun -x 10 -y 10 -W 25% -H 60%
  bind=SUPER,d,exec,wofi -S run
  bind=,Scroll_Lock,exec,pass-wofi # fn+k
  bind=,XF86Calculator,exec,pass-wofi # fn+f12
  bind=SUPER,semicolon,exec,pass-wofi
  # Toggle waybar
  bind=,XF86Tools,exec,pkill -USR1 waybar # profile button
  # Lock screen
  bind=,XF86Launch5,exec,swaylock -S
  bind=,XF86Launch4,exec,swaylock -S
  bind=SUPER,backspace,exec,swaylock -S
  # Screenshots
  bind=,Print,exec,grimblast --notify copy output
  bind=SHIFT,Print,exec,grimblast --notify copy active
  bind=CONTROL,Print,exec,grimblast --notify copy screen
  bind=SUPER,Print,exec,grimblast --notify copy window
  bind=ALT,Print,exec,grimblast --notify copy area
  # Keyboard controls (brightness, media, sound, etc)
  bind=,XF86MonBrightnessUp,exec,light -A 10
  bind=,XF86MonBrightnessDown,exec,light -U 10
  bind=,XF86AudioNext,exec,playerctl next
  bind=,XF86AudioPrev,exec,playerctl previous
  bind=,XF86AudioPlay,exec,playerctl play-pause
  bind=,XF86AudioStop,exec,playerctl stop
  bind=ALT,XF86AudioNext,exec,playerctld shift
  bind=ALT,XF86AudioPrev,exec,playerctld unshift
  bind=ALT,XF86AudioPlay,exec,systemctl --user restart playerctld
  bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%
  bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%
  bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle
  bind=SHIFT,XF86AudioMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle
  bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle
  # Window manager controls
  bind=SUPERSHIFT,x,killactive
  bind=SUPERSHIFT,e,exit
  bind=SUPER,s,togglesplit
  bind=SUPER,f,fullscreen,1
  bind=SUPERSHIFT,f,fullscreen,0
  bind=SUPERSHIFT,space,togglefloating
  bind=SUPER,minus,splitratio,-0.25
  bind=SUPERSHIFT,minus,splitratio,-0.3333333
  bind=SUPER,equal,splitratio,0.25
  bind=SUPERSHIFT,equal,splitratio,0.3333333
  bind=SUPER,g,togglegroup
  bind=SUPER,apostrophe,changegroupactive,f
  bind=SUPERSHIFT,apostrophe,changegroupactive,b
  bind=SUPER,left,movefocus,l
  bind=SUPER,right,movefocus,r
  bind=SUPER,up,movefocus,u
  bind=SUPER,down,movefocus,d
  bind=SUPER,h,movefocus,l
  bind=SUPER,l,movefocus,r
  bind=SUPER,k,movefocus,u
  bind=SUPER,j,movefocus,d
  bind=SUPERSHIFT,left,swapwindow,l
  bind=SUPERSHIFT,right,swapwindow,r
  bind=SUPERSHIFT,up,swapwindow,u
  bind=SUPERSHIFT,down,swapwindow,d
  bind=SUPERSHIFT,h,swapwindow,l
  bind=SUPERSHIFT,l,swapwindow,r
  bind=SUPERSHIFT,k,swapwindow,u
  bind=SUPERSHIFT,j,swapwindow,d
  bind=SUPERCONTROL,left,focusmonitor,l
  bind=SUPERCONTROL,right,focusmonitor,r
  bind=SUPERCONTROL,up,focusmonitor,u
  bind=SUPERCONTROL,down,focusmonitor,d
  bind=SUPERCONTROL,h,focusmonitor,l
  bind=SUPERCONTROL,l,focusmonitor,r
  bind=SUPERCONTROL,k,focusmonitor,u
  bind=SUPERCONTROL,j,focusmonitor,d
  bind=SUPERCONTROL,1,focusmonitor,DP-1
  bind=SUPERCONTROL,2,focusmonitor,DP-2
  bind=SUPERCONTROL,3,focusmonitor,DP-3
  bind=SUPERCONTROLSHIFT,left,movewindow,mon:l
  bind=SUPERCONTROLSHIFT,right,movewindow,mon:r
  bind=SUPERCONTROLSHIFT,up,movewindow,mon:u
  bind=SUPERCONTROLSHIFT,down,movewindow,mon:d
  bind=SUPERCONTROLSHIFT,h,movewindow,mon:l
  bind=SUPERCONTROLSHIFT,l,movewindow,mon:r
  bind=SUPERCONTROLSHIFT,k,movewindow,mon:u
  bind=SUPERCONTROLSHIFT,j,movewindow,mon:d
  bind=SUPERALT,left,movecurrentworkspacetomonitor,l
  bind=SUPERALT,right,movecurrentworkspacetomonitor,r
  bind=SUPERALT,up,movecurrentworkspacetomonitor,u
  bind=SUPERALT,down,movecurrentworkspacetomonitor,d
  bind=SUPERALT,h,movecurrentworkspacetomonitor,l
  bind=SUPERALT,l,movecurrentworkspacetomonitor,r
  bind=SUPERALT,k,movecurrentworkspacetomonitor,u
  bind=SUPERALT,j,movecurrentworkspacetomonitor,d
  bind=SUPER,u,togglespecialworkspace
  bind=SUPERSHIFT,u,movetoworkspace,special
  bind=SUPER,1,exec,hyprctl dispatch exec hyprsome workspace 1
  bind=SUPER,2,exec,hyprctl dispatch exec hyprsome workspace 2
  bind=SUPER,3,exec,hyprctl dispatch exec hyprsome workspace 3
  bind=SUPER,4,exec,hyprctl dispatch exec hyprsome workspace 4
  bind=SUPER,5,exec,hyprctl dispatch exec hyprsome workspace 5
  bind=SUPER,6,exec,hyprctl dispatch exec hyprsome workspace 6
  bind=SUPER,7,exec,hyprctl dispatch exec hyprsome workspace 7
  bind=SUPER,8,exec,hyprctl dispatch exec hyprsome workspace 8
  bind=SUPER,9,exec,hyprctl dispatch exec hyprsome workspace 9
  bind=SUPER,0,exec,hyprctl dispatch exec hyprsome workspace 10
  bind=SUPERSHIFT,1,exec,hyprctl dispatch exec hyprsome movefocus 1
  bind=SUPERSHIFT,2,exec,hyprctl dispatch exec hyprsome movefocus 2
  bind=SUPERSHIFT,3,exec,hyprctl dispatch exec hyprsome movefocus 3
  bind=SUPERSHIFT,4,exec,hyprctl dispatch exec hyprsome movefocus 4
  bind=SUPERSHIFT,5,exec,hyprctl dispatch exec hyprsome movefocus 5
  bind=SUPERSHIFT,6,exec,hyprctl dispatch exec hyprsome movefocus 6
  bind=SUPERSHIFT,7,exec,hyprctl dispatch exec hyprsome movefocus 7
  bind=SUPERSHIFT,8,exec,hyprctl dispatch exec hyprsome movefocus 8
  bind=SUPERSHIFT,9,exec,hyprctl dispatch exec hyprsome movefocus 9
  bind=SUPERSHIFT,0,exec,hyprctl dispatch exec hyprsome movefocus 10
  blurls=waybar
''
