local opt = vim.opt --for conciseness

--line numbers
opt.relativenumber = false
opt.number = true

--tabs and indent
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

--search
opt.ignorecase = true
opt.smartcase = true

--curosr line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace key
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
