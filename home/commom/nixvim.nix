{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = { # TODO: update nixvim to newer version
    enable = true;

    colorschemes.gruvbox.enable = true;

    options = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
    };

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      oil.enable = true;
      barbecue.enable = true;
      neogit.enable = true;
      persistence.enable = true;

      alpha = {
	enable = true;

	iconsEnabled = true;

	layout = [
	  {
            type = "padding";
            val = 6;
          }
         
	  {
            type = "text";
            val = [ 
	    "⢸⠉⣹⠋⠉⢉⡟⢩⢋⠋⣽⡻⠭⢽⢉⠯⠭⠭⠭⢽⡍⢹⡍⠙⣯⠉⠉⠉⠉⠉⣿⢫⠉⠉⠉⢉⡟⠉⢿⢹⠉⢉⣉⢿⡝⡉⢩⢿⣻⢍⠉⠉⠩⢹⣟⡏⠉⠹⡉⢻⡍⡇"
	    "⢸⢠⢹⠀⠀⢸⠁⣼⠀⣼⡝⠀⠀⢸⠘⠀⠀⠀⠀⠈⢿⠀⡟⡄⠹⣣⠀⠀⠐⠀⢸⡘⡄⣤⠀⡼⠁⠀⢺⡘⠉⠀⠀⠀⠫⣪⣌⡌⢳⡻⣦⠀⠀⢃⡽⡼⡀⠀⢣⢸⠸⡇"
	    "⢸⡸⢸⠀⠀⣿⠀⣇⢠⡿⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠘⢇⠸⠘⡀⠻⣇⠀⠀⠄⠀⡇⢣⢛⠀⡇⠀⠀⣸⠇⠀⠀⠀⠀⠀⠘⠄⢻⡀⠻⣻⣧⠀⠀⠃⢧⡇⠀⢸⢸⡇⡇"
	    "⢸⡇⢸⣠⠀⣿⢠⣿⡾⠁⠀⢀⡀⠤⢇⣀⣐⣀⠀⠤⢀⠈⠢⡡⡈⢦⡙⣷⡀⠀⠀⢿⠈⢻⣡⠁⠀⢀⠏⠀⠀⠀⢀⠀⠄⣀⣐⣀⣙⠢⡌⣻⣷⡀⢹⢸⡅⠀⢸⠸⡇⡇"
	    "⢸⡇⢸⣟⠀⢿⢸⡿⠀⣀⣶⣷⣾⡿⠿⣿⣿⣿⣿⣿⣶⣬⡀⠐⠰⣄⠙⠪⣻⣦⡀⠘⣧⠀⠙⠄⠀⠀⠀⠀⠀⣨⣴⣾⣿⠿⣿⣿⣿⣿⣿⣶⣯⣿⣼⢼⡇⠀⢸⡇⡇⠇"
	    "⢸⢧⠀⣿⡅⢸⣼⡷⣾⣿⡟⠋⣿⠓⢲⣿⣿⣿⡟⠙⣿⠛⢯⡳⡀⠈⠓⠄⡈⠚⠿⣧⣌⢧⠀⠀⠀⠀⠀⣠⣺⠟⢫⡿⠓⢺⣿⣿⣿⠏⠙⣏⠛⣿⣿⣾⡇⢀⡿⢠⠀⡇"
	    "⢸⢸⠀⢹⣷⡀⢿⡁⠀⠻⣇⠀⣇⠀⠘⣿⣿⡿⠁⠐⣉⡀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠳⠄⠀⠀⠀⠀⠋⠀⠘⡇⠀⠸⣿⣿⠟⠀⢈⣉⢠⡿⠁⣼⠁⣼⠃⣼⠀⡇"
	    "⢸⠸⣀⠈⣯⢳⡘⣇⠀⠀⠈⡂⣜⣆⡀⠀⠀⢀⣀⡴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⣆⣀⠀⠀⠀⣀⣜⠕⡊⠀⣸⠇⣼⡟⢠⠏⠀⡇"
	    "⢸⠀⡟⠀⢸⡆⢹⡜⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⣾⡏⡇⡎⡇⠀⡇"
	    "⢸⠀⢃⡆⠀⢿⡄⠑⢽⣄⠀⠀⠀⢀⠂⠠⢁⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠄⡐⢀⠂⠀⠀⣠⣮⡟⢹⣯⣸⣱⠁⠀⡇"
	    "⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁"
	    ];
           
	    opts = {
              position = "center";
              hl = "Number";
            };
          }
          
	  {
            type = "padding";
            val = 2;
          }
	  
	  {
	    opts = {
	      hl = "AlphaButtons";
	      position = "center";
	      spacing = 1;
	    };
	  
	    type = "group";
	    val = [
	      {
		command = "<CMD>Telescope find_files<CR>";
		desc = "  Find file";
		shortcut = "f";
	      }

	      {	
		command = ":ene <BAR> startinsert <CR>";
		desc = "  New file";
		shortcut = "n";
	      }

	      {
		command = ":Telescope oldfiles <CR>";
		desc = "  Recent files";
		shortcut = "r";
	      }

	      {
		command = ":Telescope live_grep <CR>";
		desc = "  Find text";
		shortcut = "g";
	      }

	      {
		command = ":lua require('persistence').load()<cr>";
		desc = "  Restore Session";
		shortcut = "s";
	      }

	      {
		command = ":qa<CR>";
		desc = "  Quit Neovim";
		shortcut = "q";
	      }
	    ];
	  }
	  
	  {
            type = "text";
            val = "Go write some code your fucking lazy.";
            opts = {
              position = "center";
              hl = "Number";
            };
          }
	];
      };

      lsp = {
	enable = true;
	servers = {
          tsserver.enable = true;
	  lua-ls.enable = true;
	  nixd.enable = true;
	  hls.enable = true;
	  jsonls.enable = true;
	  cssls.enable = true;
	  html.enable = true;
	};
      };

      luasnip = {
	enable = true;
	
	extraConfig = {
	enable_autosnippets = true;
	store_selection_keys = "<Tab>";
	};
      };
      
      nvim-cmp = {
	enable = true;
	autoEnableSources = true;
	sources = [
	  {name = "luasnip";}
	  {name = "path";}
	  {name = "buffer";}
	];
      };
    };

    globals.mapleader = ",";

    keymaps = [
      # Telescope
      {
	mode = "n";
	action = "<cmd>Telescope find_files<CR>";
	key = "<leader>ff";
      }
      {
	mode = "n";
	action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>fg";
      }
      {
	mode = "n";
	action = "<cmd>Telescope buffers<CR>";
	key = "<leader>fb";
      }
      {
	mode = "n";
	action = "<cmd>Telescope help_tags<CR>";
	key = "<leader>fh";
      }

      # Oil
      {
	mode = "n";
	action = "<cmd>Oil<CR>";
	key = "<leader>o";
      }
    ];
  };
}
