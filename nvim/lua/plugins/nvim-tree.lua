local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
	return
end

-- settings for nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({})

--barbar offset
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			require("bufferline.api").set_offset(31, "FileTree")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		if vim.fn.expand("<afile>"):match("NvimTree") then
			require("bufferline.api").set_offset(0)
		end
	end,
})
