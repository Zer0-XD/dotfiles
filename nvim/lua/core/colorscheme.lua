-- require("nightfox").setup({
-- 	options = {
-- 		transparent = true,
-- 		styles = {
-- 			comments = "italic",
-- 			keywords = "bold",
-- 			types = "italic,bold",
-- 		},
-- 	},
-- })
--
require("onedark").setup({
	code_style = {
		comments = "italic",
		functions = "italic,bold",
		strings = "bold",
		variables = "bold",
	},
	transparent = true,
	colors = { hint = "orange", error = "#cc0113" },
	highlights = {
		["@function.builtin"] = { fg = "#9aaffa", fmt = "italic" },
	},
})

vim.cmd("colorscheme onedark")

local status, _ = pcall(vim.cmd, "colorscheme onedark")

if not status then
	print("Colorscheme not found...")
	return
end
