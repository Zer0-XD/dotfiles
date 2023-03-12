-- require("onedark").setup({
-- 	code_style = {
-- 		comments = "italic",
-- 		functions = "italic,bold",
-- 		strings = "bold",
-- 		variables = "bold",
-- 	},
-- 	transparent = true,
-- 	colors = { hint = "orange", error = "#cc0113" },
-- 	highlights = {
-- 		["@parameter"] = { fg = "#e9a00f" },
-- 		["@function.builtin"] = { fg = "#9aaffa", fmt = "italic" },
-- 	},
-- })

-- require("catppuccin").setup({
-- 	flavour = "frappe", -- latte, frappe, macchiato, mocha
-- 	background = { -- :h background
-- 		light = "latte",
-- 		dark = "frappe",
-- 	},
-- 	transparent_background = true,
-- 	term_colors = false,
-- 	dim_inactive = {
-- 		enabled = false,
-- 		shade = "dark",
-- 		percentage = 0.15,
-- 	},
-- 	no_italic = false, -- Force no italic
-- 	no_bold = false, -- Force no bold
-- 	styles = {
-- 		comments = { "italic" },
-- 		conditionals = { "italic" },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = { "italic" },
-- 		strings = { "italic" },
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 	},
-- 	color_overrides = {},
-- 	custom_highlights = {},
-- 	integrations = {
-- 		cmp = true,
-- 		gitsigns = true,
-- 		nvimtree = true,
-- 		telescope = true,
-- 		notify = false,
-- 		mini = false,
-- 		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
-- 	},
-- })

require("kanagawa").setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = { bold = true },
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	globalStatus = true, -- adjust window separators highlight for laststatus=3
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	theme = "dark", -- Load "default" theme or the experimental "light" theme
})

-- setup must be called before loading
vim.cmd.colorscheme("kanagawa")

vim.cmd("colorscheme kanagawa")
local status, _ = pcall(vim.cmd, "colorscheme kanagawa")

if not status then
	print("Colorscheme not found...")
	return
end
