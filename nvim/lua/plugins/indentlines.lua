vim.opt.list = false
vim.opt.termguicolors = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#1F1F28 gui=nocombine]])

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
})
