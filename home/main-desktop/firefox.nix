{ pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.gabriel = {
      bookmarks = { };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
	sponsorblock
      ];
      settings = {
	"browser.shell.checkDefaultBrowser" = false;
        "dom.security.https_only_mode" = true;
      };
    };
  };
}
