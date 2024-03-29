-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")

if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim") --for improving load time

	-- color schemes
	-- use("navarasu/onedark.nvim")
	use("tribela/vim-transparent")
	-- use("olimorris/onedarkpro.nvim")
	-- use("marko-cerovac/material.nvim")
	-- use("EdenEast/nightfox.nvim")
	use("rmehri01/onenord.nvim")
	-- use("lunarvim/synthwave84.nvim")
	use("JoosepAlviste/palenightfall.nvim")
	-- use("marko-cerovac/material.nvim")
	-- use({ "catppuccin/nvim", as = "catppuccin" })

	-- use("ghifarit53/tokyonight-vim")
	-- use("folke/tokyonight.nvim")
	use("tiagovla/tokyodark.nvim")
	use("rebelot/kanagawa.nvim")

	-- use("Lunarvim/onedarker")
	-- use({ "catppuccin/nvim", as = "catppuccin" })

	use("norcalli/nvim-colorizer.lua")
	-- use("NvChad/nvim-colorizer.lua")

	-- use({
	-- 	"mrshmllow/document-color.nvim",
	-- 	config = function()
	-- 		require("document-color").setup({
	-- 			-- Default options
	-- 			mode = "background", -- "background" | "foreground" | "single"
	-- 		})
	-- 	end,
	-- })

	use({
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		module = "tailwindcss-colors",
		-- run the setup function after plugin is loaded
		config = function()
			-- pass config options here (or nothing to use defaults)
			require("tailwindcss-colors").setup()
		end,
	})

	use("petertriho/nvim-scrollbar") --scrollbar with linting

	--wordwrapping
	use({
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup()
			require("wrapping").soft_wrap_mode()
		end,
	})

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- use("rcarriga/nvim-notify") --nvim enhanced error notification

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	--[[ 	use("numToStr/Comment.nvim") ]]

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use("nvim-lua/plenary.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	use("mlaursen/vim-react-snippets") --react snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	-- use({
	-- 	"glepnir/lspsaga.nvim",
	-- 	branch = "main",
	-- }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	})

	-- use("terryma/vim-multiple-cursors") --multiple cursor like vscode and sublime text

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("lukas-reineke/indent-blankline.nvim") --indentlines
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	--topbar with opened tabs
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use("fedepujol/move.nvim") -- move lines horizontally and vertically

	--matching tags
	use("leafOfTree/vim-matchtag")

	use("JoosepAlviste/nvim-ts-context-commentstring")

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use("nvim-telescope/telescope-media-files.nvim") --telescope-media-files

	-- use({
	-- 	"folke/trouble.nvim",
	-- 	requires = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		require("trouble").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		})
	-- 	end,
	-- })

	--end of plugins list

	if packer_bootstrap then
		require("packer").sync()
	end
end)
