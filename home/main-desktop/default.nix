{ pkgs, inputs, ... }:
{
  imports = [
    ./nixvim.nix
    ./git.nix
    ./waybar.nix
    ./hyprland.nix
    ./nushell.nix
    ./alacritty.nix
    ./firefox.nix
  ];

  home.stateVersion = "23.05";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";
   
    packages = with pkgs; [
      grim
      slurp
      wofi # TODO rice wofi
      racket
      hyprpaper
      obs-studio

      # neovim dependencies
      ripgrep
      wl-clipboard
    ];
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  xdg = {
    enable = true;
  };
}
