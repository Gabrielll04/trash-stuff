{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
	monitor = "HDMI-A-1,1920x1080@144,0x0,1";
	input = {
        kb_layout = "us";
	kb_variant = "intl";
      };
      dwindle = {
	pseudotile = "yes";
	preserve_split = "yes";
      };
      bind = [
        "SUPER, Return, exec, alacritty"
	
        "SUPER, q, killactive"
	"SUPER, m, exit"
	"SUPERSHIFT, f, fullscreen"
	"SUPERSHIFT, p, exec, slurp | grim -g - ~/Pictures/\$(date +'screenshot%Y-%m-%d-%H%M%S.png')"
	"SUPER, 1, workspace, 1"
	"SUPER, 2, workspace, 2"
	"SUPER, 3, workspace, 3"
	"SUPER, 4, workspace, 4"
	"SUPER, 5, workspace, 5"
	"SUPER, 6, workspace, 6"
	"SUPER, 7, workspace, 7"
	"SUPER, 8, workspace, 8"
	"SUPER, 9, workspace, 9"
	"SUPER, 0, workspace, 0"

	"SUPERSHIFT, 1, movetoworkspace, 1"
	"SUPERSHIFT, 2, movetoworkspace, 2"
	"SUPERSHIFT, 3, movetoworkspace, 3"
	"SUPERSHIFT, 4, movetoworkspace, 4"
	"SUPERSHIFT, 5, movetoworkspace, 5"
	"SUPERSHIFT, 6, movetoworkspace, 6"
	"SUPERSHIFT, 7, movetoworkspace, 7"
	"SUPERSHIFT, 8, movetoworkspace, 8"
	"SUPERSHIFT, 9, movetoworkspace, 9"
	"SUPERSHIFT, 0, movetoworkspace, 0"

	"SUPER, S, togglespecialworkspace, magic"
	"SUPERSHIFT, S, movetoworkspace, special:magic"

	"SUPER, left, movefocus, l"
	"SUPER, right, movefocus, r"
	"SUPER, up, movefocus, u"
	"SUPER, down, movefocus, d"

	"SUPER, P, pseudo"
	"SUPER, J, togglesplit"
	"SUPER, V, togglefloating"
      ];
      bindm = [
   	"SUPER, mouse:272, movewindow"
	"SUPER, mouse:273, resizewindow"
      ];

      general = {
	border_size = 1;
      };

      decoration = {
	rounding = 2;
	#active_opacity = 0.9;
	#inactive_opacity = 0.7;
      };

      exec-once = [
	"waybar"
	"hyprpaper -c ~/.config/hypr/hyprpaper.conf"
      ];
    };
  };
}
