-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

require("luasnip").filetype_extend("javascript", { "javascriptreact" })
require("luasnip").filetype_extend("javascript", { "html" })

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		maxwidth = 50,
	-- 		ellipsis_char = "...",
	-- },
	-- 	}),
	--
	window = {
		completion = cmp.config.window.bordered({
			col_offset = -3,
			-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			border = "rounded",
		}),
		documentation = cmp.config.window.bordered({
			-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		}),

		-- completion = {
		-- 	col_offset = -3, -- align the abbr and word on cursor (due to fields order below)
		-- },
	},
	experimental = {
		ghost_text = true,
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...",
			menu = { -- showing type in menu
				nvim_lsp = "[LSP]",
				path = "[Path]",
				buffer = "[Buffer]",
				luasnip = "[LuaSnip]",
			},
			before = function(entry, vim_item) -- for tailwind css autocomplete
				if vim_item.kind == "Color" and entry.completion_item.documentation then
					local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
					if r then
						local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
						local group = "Tw_" .. color
						if vim.fn.hlID(group) < 1 then
							vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
						end
						vim_item.kind = "■" -- or "⬤" or anything
						vim_item.kind_hl_group = group
						return vim_item
					end
				end
				-- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
				-- or just show the icon
				vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
				return vim_item
			end,
		}),
	},
})
