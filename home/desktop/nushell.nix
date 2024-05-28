{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    
    environmentVariables = {
      PROMPT_INDICATOR_VI_INSERT = ''": "'';
      PROMPT_INDICATOR_VI_NORMAL = ''"∙ "'';
      PROMPT_COMMAND = ''""'';
      PROMPT_COMMAND_RIGHT = ''""'';
      SHELL = ''"${pkgs.nushell}/bin/nu"'';
      EDITOR = ''"nvim"'';
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
    };
    
    extraConfig = let
      conf = builtins.toJSON {
	show_banner = true;
	edit_mode = "vi";
	shell_integration = true;

	ls.clickable_links = true;
	rm.always_trash = true;

	table = {
          mode = "rounded";
          index_mode = "always";
          header_on_separator = false;
        };

        cursor_shape = {
          vi_insert = "line";
          vi_normal = "block";
        };
	
	menus = [
	  {
            name = "completion_menu";
            only_buffer_difference = false;
            marker = "? ";
            type = {
              layout = "columnar";
              columns = 4;
              col_padding = 2;
            };
            style = {
              text = "magenta";
              selected_text = "blue_reverse";
              description_text = "yellow";
            };
          }
	]; 
      };

      completions = let
	completion = name: ''
	  source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
	'';
      in
	names:
	  builtins.foldl' (prev: str: "${prev}\n${str}") ""
	  (map (name: completion name) names);
    in ''
      $env.config = ${conf};
      ${completions ["git" "nix"]}
    '';
  };
}
