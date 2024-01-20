{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
  	enable = true;
    	systemdIntegration = true;
    	extraConfig = ''
		monitor=eDP-1, 1920x1080@60,0x0,1

		env = XCURSOR_SIZE,24

		exec-once = waybar
		input {
		    kb_layout =us, ru
		    kb_variant =
		    kb_model =
		    kb_options =grp:alt_shift_toggle
		    kb_rules = 
		    follow_mouse = 1

		    touchpad {
			natural_scroll = no
		    }

		    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
		}

		general {

		    gaps_in = 5
		    gaps_out = 20
		    border_size = 2
		    col.active_border = rgba(50c878ff) rgba(d1ffbdff) 45deg
		    col.inactive_border = rgba(595959aa)
		    #col.group_border = rgba(83A598ff)
		    layout = dwindle
		}

		decoration {

		    rounding = 10
		    
		    blur {
			enabled = true
			size = 7
			passes = 4
			new_optimizations = true
		    }

		    blurls = locksreen
		    drop_shadow = yes
		    shadow_range = 4
		    shadow_render_power = 3
		    col.shadow = rgba(1a1a1aee)
		}

		animations {
		    enabled = yes


		    bezier = myBezier, 0.05, 0.9, 0.1, 1.05    
		    bezier = bebra1, 0, 0.55, 0.45, 1
			
		    animation = windows, 1, 4, bebra1 
		    animation = windowsOut, 1, 7, default, popin 80%
		    animation = border, 1, 10, default
		    animation = borderangle, 1, 8, default
		    animation = fade, 1, 7, default
		    animation = workspaces, 1, 7, default 
		}

		dwindle {
		    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		    preserve_split = yes # you probably want this
		}

		master {
		    new_is_master = true
		}

		gestures {
		    # See https://wiki.hyprland.org/Configuring/Variables/ for more
		    workspace_swipe = off
		}

		# Example per-device config
		# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
		device:epic-mouse-v1 {
		    sensitivity = -0.5
		}

		# Example windowrule v1
		windowrule = float,^(imv)$
		windowrulev2 = opacity 0.8 0.8,class:^(kitty)$ 
		# Example windowrule v2
		# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


		# See https://wiki.hyprland.org/Configuring/Keywords/ for more
		$mainMod = ALT

		# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
		bind = $mainMod, Return, exec, kitty
		bind = $mainMod, F, fullscreen
		bind = $mainMod, Q, killactive, 
		bind = $mainMod, M, exit, 
		bind = $mainMod, E, exec, dolphin
		bind = $mainMod, V, togglefloating, 
		bind = $mainMod, R, exec, wofi --show drun
		bind = $mainMod, P, pseudo, # dwindle
		bind = $mainMod, W, togglesplit, # dwindle
		# Move focus with mainMod + arrow keys
		bind = $mainMod, H, movefocus, l
		bind = $mainMod, L, movefocus, r
		bind = $mainMod, K, movefocus, u
		bind = $mainMod, J, movefocus, d

		# Switch workspaces with mainMod + [0-9]
		bind = $mainMod, 1, workspace, 1
		bind = $mainMod, 2, workspace, 2
		bind = $mainMod, 3, workspace, 3
		bind = $mainMod, 4, workspace, 4
		bind = $mainMod, 5, workspace, 5
		bind = $mainMod, 6, workspace, 6
		bind = $mainMod, 7, workspace, 7
		bind = $mainMod, 8, workspace, 8
		bind = $mainMod, 9, workspace, 9
		bind = $mainMod, 0, workspace, 10

		# Move active window to a workspace with mainMod + SHIFT + [0-9]
		bind = super, 1, movetoworkspace, 1
		bind = super, 2, movetoworkspace, 2
		bind = super, 3, movetoworkspace, 3
		bind = super, 4, movetoworkspace, 4
		bind = super, 5, movetoworkspace, 5
		bind = super, 6, movetoworkspace, 6 
		bind = super, 7, movetoworkspace, 7 
		bind = super, 8, movetoworkspace, 8 
		bind = super, 9, movetoworkspace, 9 
		bind = super, 0, movetoworkspace, 10 

		#programms
		bind = $mainMod, U, exec, chromium 
		bind = $mainMod, T, exec, ./Downloads/Telegram/Telegram 
		#bind = ,Print, exec, flameshot gui
		bind = , Print, exec, grim -g "$(slurp)" - | swappy -f -
		#volume
		#bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +2%
		#bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -2%
		#bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle

		bind = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
		bind = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

		bind=,XF86AudioMute,exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
		bind=, XF86AudioPrev,exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
		#bind=, XF86AudioPlay,exec, pactl set-source-mute 5 1
		#brightness
		bind=,XF86MonBrightnessDown,exec,brillo -q -U 2%
		bind=,XF86MonBrightnessUp,exec,brillo -q -A 2% 


		# Scroll through existing workspaces with mainMod + scroll
		bind = $mainMod, mouse_down, workspace, e+1
		bind = $mainMod, mouse_up, workspace, e-1

		# Move/resize windows with mainMod + LMB/RMB and dragging
		bindm = $mainMod, mouse:272, movewindow
		bindm = $mainMod, mouse:273, resizewindow	
	'';
	};
}
