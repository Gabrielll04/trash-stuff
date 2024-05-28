{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
	     * {
	       font-family: "JetBrainsMono Nerd Font";
	       font-size: 12pt;
	       font-weight: bold;
	       border-radius: 0px;
             }
	window#waybar {
	  background-color: transparent;
	}
	window#waybar > box {
	  box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.1),0px 10px 15px -3px rgba(0,0,0,0.1);
	}
	window > box {
	  background-color: rgb(30,30,46);
	}
	#workspaces {
	  padding-left: 0px;
	  padding-right: 0px;
	}
	#workspaces button.active {
	  background-color: rgb(248, 189, 150);
	}
	#clock {
	  color: rgb(217, 224, 238);
	}
	#custom-launcher {
	  font-size: 18px;
	  padding-left: 8px;
	  padding-right: 6px;
	  color: #7ebae4;
	}
	#pulseaudio, #memory, #network, #custom-powermenu, #tray {
	  padding-left: 10px;
	  padding-right: 10px;
	}
	#pulseaudio {
	  font-size: 18px;
	  color: rgb (248, 189, 150);
	}
	#memory {
	  font-size: 18px;
	  color: rgb(181, 232, 224);
	}
	#network {
	  color: #ABE9B3;
	}
	#custom-powermenu {
	  color: rgb(242, 143, 173);
	  font-size: 16px;
	}
	#tray {
	  padding-right: 8px;
	  padding-left: 10px;
	}
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";

      modules-left = [
	"custom/launcher"
	"hyprland/workspaces"
	"temperature"
      ];
      modules-center = [
	"clock"
      ];
      modules-right = [
	"pulseaudio"
	"memory"
	"network"
	"custom/powermenu"
	"tray"
      ];
      "custom/launcher" = {
	"format" = " ";
	"on-click" = "";
	"tooltip" = false;
      };
      "clock" = {
	"interval" = 1;
	"format" = "{:%I:%M %A %b %d}";
	"tooltip" = true;
	"tooltip-format" = "上午：高数\n下午：Ps\n晚上：Golang\n<tt>{calendar}</tt>";
      };
      "pulseaudio" = {
	"format" = "{icon} {volume}%";
	"format-muted" = "󰖁 Muted";
	"format-icons" = [ "" "" "" ];
      };
      "memory" = {
	"interval" = 1;
	"format" = "󰍛 {percentage}%";
	"states" = {
	  "warning" = 85;
	};
      };
      "network" = {
	"format-disconnected" = "󰤭 Disconnected";
	"format-wifi" = "󰤨 {essid}";
	"format-ethernet" = "󰤨 {ifname}";
	"interval" = 1;
	"tooltip" = false;
      };
      "custom/powermenu" = {
	"format" = "⏻";
	"on-click" = "poweroff";
	"tooltip" = false;
      };
    }];
  };
}
