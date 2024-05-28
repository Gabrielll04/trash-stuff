{pkgs, ...}: {
 
  home.packages = with pkgs; [
    pokemon-colorscripts-mac
    nitch
    feh
    obs-studio
    cowsay
  ];

  programs.git = {
    enable = true;

    userName = "Gabrielll04";
    userEmail = "gabrielggcarneiro04@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
    };
  };

  programs.firefox = {
    enable = true;
    profiles.gabriel = {
      isDefault = true;
      path = "gabriel.default";

      settings = {
        "signon.rememberSignons" = false;
      };
    };
  };

  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9; 
      
      shell = {
        program = "/bin/sh";
        args = [ "-c" "clear && nitch random && $SHELL" ];
      };

      Font = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold";
      };
    };
  };

  programs.nushell = {
    enable = true;
    
    extraConfig = ''
      $env.config = {
        show_banner: false
      }
    '';
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };

  services.picom = {
    enable = true;
    activeOpacity = 1;
    inactiveOpacity = 1;
    fade = true;
    opacityRules = [
      "90:class_g = 'URxvt'"
      "90:class_g = 'Alacritty' && focused"
      "70:class_g = 'Alacritty' && !focused"
    ];

    backend = "glx";

    settings = {
      blur = {
        method = "dual_kawase";
        size = 20;
        deviation = 5.0;
        background-exclude = [ "window_type = 'dock'" ];
      };
    };
  };

  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";
  home.stateVersion = "22.11"; # To figure this out you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
}
