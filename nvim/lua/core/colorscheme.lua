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

--synthwave84 setup
-- require("synthwave84").setup({
-- 	glow = {
-- 		error_msg = true,
-- 		type2 = true,
-- 		func = true,
-- 		keyword = true,
-- 		operator = false,
-- 		buffer_current_target = true,
-- 		buffer_visible_target = true,
-- 		buffer_inactive_target = true,
-- 	},
-- })

vim.cmd("colorscheme tokyonight")

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")

if not status then
	print("Colorscheme not found...")
	return
end
