{ pkgs, ... }:

{
    programs.nixvim = {
    	globals.mapleader = " ";
	opts = {
	    number = true;
	    relativenumber = true;
	    shiftwidth = 4;
	};	
        enable = true;
	defaultEditor = true;
	colorschemes.catppuccin = {
	    enable = true;
	    settings = {
		transparent_background = true;
	    };
	};
	# Keymaps 
	keymaps = [
	    {
		action = "<CMD>Oil --float<CR>";
		key = "<leader>pv";
		options = {
		    silent = true;
		    desc = "Open Oil in floting window";
		};
	    }
	    {
		action = "<CMD>%s/\'/\"/g|%!jq<CR>";
		key = "<leader>fj";
		options = {
		    silent = true;
		    desc = "[F]ormat [J]son string";
		};
	    }
	];
	# Plugins 

	# noice 
	plugins.noice.enable = true;

	# todo comments
	plugins.todo-comments = {
	    enable = true;
	};
	# Zen mode 
	plugins.zen-mode.enable = true;
	# Surround
	plugins.surround.enable = true;
	# Git
	plugins.fugitive.enable = true;
	plugins.gitsigns.enable = true;
	# file manager 
	plugins.oil.enable = true; # file manager 
	plugins.oil.settings.view_options.show_hidden = true;
	plugins.toggleterm.enable = true;
	# lsp setup
	plugins.lsp = {
	    enable = true;
	    servers = {
		lua-ls.enable = true;
		elixirls = {
		    enable = true;
		};
		nextls.enable = false;
		lexical.enable = false;
		pylsp.enable = false;
		# rnix-lsp.enable = true;
		nil-ls.enable = true;
		pyright.enable = false;
		jsonls.enable = false;
	    };
	    keymaps = {
		diagnostic = {
		    "<leader>j" = "goto_next";
		    "<leader>k" = "goto_prev";
		};
		lspBuf = {
		    K = "hover";
		    gD = "references";
		    gd = "definition";
		    gi = "implementation";
		    gt = "type_definition";
		    ca = "code_action";
		};
	    };
	};
	plugins.lsp-lines.enable = true;
	plugins.fidget = {
	    enable = true;
	    progress = {
	      suppressOnInsert = true;
	      ignoreDoneAlready = true;
	      pollRate = 0.5;
	    };
	};
	plugins.none-ls = {
	    enable = false;
	};
	# completion
	plugins.cmp = {
	    enable = true;
	    autoEnableSources = true;
	    settings.sources = [
		{ name = "nvim_lsp";}
		{ name = "path";}
		{ name = "buffer";}
		{ name = "luasnip";}
		#{ name = "vsnip"; }
	    ];
	    settings.snippet = {
		expand = "function(args) require('luasnip').lsp_expand(args.body) end"; 
	    };
	    settings.mapping = {
		"<C-Space>" = "cmp.mapping.complete()";
		"<C-d>" = "cmp.mapping.scroll_docs(-4)";
		"<C-e>" = "cmp.mapping.close()";
		"<C-f>" = "cmp.mapping.scroll_docs(4)";
		"<C-y>" = "cmp.mapping.confirm({ select = true })";
		"<UP>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
		"<DOWN>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	    };
	};
	plugins.cmp-nvim-lsp.enable = true;
	plugins.cmp_luasnip.enable = true;
	#plugins.cmp-vsnip.enable = true; 
	# Treesitter
	plugins.treesitter = {
	    enable = true;
	    nixvimInjections = true;
	    settings = {
		auto_install = true;
		highlight = {
		    enable = true;	
		};
	    };
	};
	# Telescope
	plugins.telescope = {
	    enable = true;
	    keymaps = {
		"<leader>sh" = {
		    action = "help_tags";
		    options = {
			desc = "[S]earch [H]elp";
		    };
		};
		"<leader>." = {
		    action = "find_files";
		    options = {
			desc = "Search Files (.)";
		    };
		};
		"<leader>sk" = {
		    action = "keymaps";
		    options = {
			desc = "[S]earch [K]eymaps";
		    };
		};
		"<leader>sw" = {
		    action = "grep_string";
		    options = {
			desc = "[S]earch current [W]ord";
		    };
		};
		"<leader>/" = {
		    action = "current_buffer_fuzzy_find";
		    options = {
			desc = "(/) fuzzy find word";
		    };
		};
	    };
	};
	# Lualine 
	plugins.lualine.enable = true;
	# luasnip
	plugins.luasnip = {
	    enable = true;
	};
	# harpoon
	plugins.harpoon = {
	    enable = true;
	    enableTelescope = true;
	    keymaps = {
		addFile = "<leader>a";
		toggleQuickMenu = "<leader>d";
	    };
	    menu = {
		height = 20;
		width = 100;
	    };

	};
	
	# Extra plugins not in nixvim options
	extraPlugins = with pkgs.vimPlugins; [
	    vim-dadbod
	    vim-dadbod-ui
	    vim-dadbod-completion
	    elixir-tools-nvim
	    nvim-jqx
	];
	extraConfigLua = "
	    require('elixir').setup({
	      nextls = {enable = false},
	      elixirls = {enable = false},
	      projectionist = {enable = true},
	    })
	";
	
    };
}
