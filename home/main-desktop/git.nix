{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Gabrielll04";
    userEmail = "gabrielggcarneiro04@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
    };
  
    ignores = [
      "target/"
      ".cache/"
      ".idea/"
      "*.elc"
      ".~lock*"
      "auto-save-list"
      "result"
      "result-*"
      "node_modules/"
      ".envrc"
      ".direnv/"
    ];
  };
}
