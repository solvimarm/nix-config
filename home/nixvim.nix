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
	    transparentBackground = true;
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
	];
	# Plugins 

	plugins.surround.enable = true;

	# file manager 
	plugins.oil.enable = true; # file manager 
	# lsp setup
	plugins.lsp = {
	    enable = true;
	    servers = {
		lua-ls.enable = true;
		elixirls.enable = true;
		pylsp.enable = true;
		# rnix-lsp.enable = true;
		nil_ls.enable = true;
		pyright.enable = true;
		jsonls.enable = true;
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
	    settings.mapping = {
		"<C-Space>" = "cmp.mapping.complete()";
		"<C-d>" = "cmp.mapping.scroll_docs(-4)";
		"<C-e>" = "cmp.mapping.close()";
		"<C-f>" = "cmp.mapping.scroll_docs(4)";
		"<CR>" = "cmp.mapping.confirm({ select = true })";
		"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
		"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	    };
	};
	plugins.cmp-nvim-lsp.enable = true;
	plugins.cmp_luasnip.enable = true;
	#plugins.cmp-vsnip.enable = true; 
	# Treesitter
	plugins.treesitter.enable = true;
	# Telescope
	plugins.telescope = {
	    enable = true;
	    keymaps = {
		"<leader>sh" = {
		    action = "help_tags";
		    desc = "[S]earch [H]elp";
		};
		"<leader>sf" = {
		    action = "find_files";
		    desc = "[S]earch [F]iles";
		};
		"<leader>sk" = {
		    action = "keymaps";
		    desc = "[S]earch [K]eymaps";
		};
		"<leader>sw" = {
		    action = "grep_string";
		    desc = "[S]earch current [W]ord";
		};
	    };
	};
	# Lualine 
	plugins.lualine.enable = true;
	# luasnip
	plugins.luasnip.enable = true;
	# plugins.vsnip.enable = true;
	# harpoon
	plugins.harpoon = {
	    enable = true;
	    enableTelescope = true;
	    keymaps = {
		addFile = "<leader>a";
		toggleQuickMenu = "<leader>d";
	    };

	};
	
	# Extra plugins not in nixvim options
	extraPlugins = with pkgs.vimPlugins; [
	    vim-dadbod
	    vim-dadbod-ui
	    vim-dadbod-completion
	];
	
    };
}
