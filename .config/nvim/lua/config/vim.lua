local opt = vim.opt
local o = vim.o

o.laststatus = 3
o.showmode = false

o.cursorline = true
o.cursorlineopt = "number"

o.ignorecase = true
o.smartcase = true

o.mouse = "a"

o.nu = true
o.relativenumber = true
o.numberwidth = 2

opt.fillchars = { eob = " " }

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8

opt.updatetime = 50
opt.colorcolumn = { "80", "120" }
opt.wrap = false
opt.termguicolors = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Indentation settings
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

local filetypes = { -- file types that should have 2 spaces indentation
	"html",
	"css",
}

vim.cmd("augroup IndentationSettings")
vim.cmd("autocmd!")

for _, filetype in ipairs(filetypes) do
	vim.cmd("autocmd FileType " .. filetype .. " setlocal tabstop=2 shiftwidth=2")
end

vim.cmd("augroup END")

-- add binaries installed by mason.nvim to path
local sep = "/"
local delim = ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- add icons to LSP diagnostics
local severity_icons = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.INFO] = " ",
	[vim.diagnostic.severity.HINT] = "󰌵 ",
}

local get_icon_from_diagnostic = function(diagnostic)
	return severity_icons[diagnostic.severity] or "●"
end

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = true,
	float = {
		format = function(diagnostic)
			local MAX_MESSAGE_LENGTH = 50
			local message = diagnostic.message
			if #message > MAX_MESSAGE_LENGTH then
				message = message:sub(1, MAX_MESSAGE_LENGTH - 3) .. "..."
			end
			return string.format("%s %s", get_icon_from_diagnostic(diagnostic), message)
		end,
	},
	virtual_text = {
		prefix = get_icon_from_diagnostic,
		spacing = 2,
		align = "eol",
	},
})

-- transparent background
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
