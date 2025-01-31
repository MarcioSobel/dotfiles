local opt = vim.opt
local o = vim.o

o.laststatus = 3
o.showmode = false

o.cursorline = true
o.cursorlineopt = "number"

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true
o.relativenumber = true
o.numberwidth = 2

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- INDENTATION SETTINGS
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

local filetypes = { -- file types that should have 2 spaces indentation
	"html",
	"css",
}

vim.cmd("augroup IndentationSettings")
vim.cmd("autocmd!")

for _, filetype in ipairs(filetypes) do
	vim.cmd("autocmd FileType " .. filetype .. " setlocal tabstop=2 shiftwidth=2 expandtab")
end

vim.cmd("augroup END")

-- add binaries installed by mason.nvim to path
local sep = "/"
local delim = ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
