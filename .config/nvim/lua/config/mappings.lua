local map = vim.keymap.set
local noremap = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = true
	map(mode, lhs, rhs, opts)
end

-- disable accidentally quitting neovim :sob:
noremap("n", "Q", "<nop>", { noremap = true })

-- center screen when scrolling
noremap("n", "<C-d>", "<C-d>zz")
noremap("n", "<C-u>", "<C-u>zz")
noremap("n", "n", "nzzzv")
noremap("n", "N", "Nzzzv")

-- use this to paste without overwritting
-- your current paste buffer
noremap("x", "<leader>p", '"_dP', { desc = "Paste without overwritting current buffer" })

-- same but with delete
noremap("n", "<leader>d", '"_d', { desc = "Delete without overwritting current buffer" })
noremap("v", "<leader>d", '"_d', { desc = "Delete without overwritting current buffer" })

-- copy to system clipboard
map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

-- comments
noremap("n", "<leader>/", "gcc", { desc = "Toggle comment" })
noremap("v", "<leader>/", "gc", { desc = "Toggle comment" })

-- window navigation
noremap("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Switch window left" })
noremap("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Switch window right" })
noremap("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Switch window down" })
noremap("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Switch window up" })
noremap("n", "<leader>sph", "<C-w>s", { desc = "Split window horizontally —" })
noremap("n", "<leader>spv", "<C-w>v", { desc = "Split window vertically |" })

-- file manipulation
noremap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer changes to file" })

-- diagnostics
map("n", "<leader>fd", function()
	vim.diagnostic.open_float()
end, { desc = "Show diagnostics" })

-- telescope mappings
map("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Telescope git status" })
map("n", "<leader>gcb", require("telescope.builtin").git_branches, { desc = "Telescope git branches" })
map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
map("n", "<leader>fad", require("telescope.builtin").diagnostics, { desc = "Telescope all LSP diagnostics" })
map("n", "<C-f>", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Telescope find in current buffer" })
map("n", "<leader>ff", function()
	local telescope = require("telescope.builtin")

	if not pcall(telescope.git_files, { show_untracked = true }) then
		telescope.find_files({ follow = true })
	end
end, { desc = "Telescope find files" })
map("n", "<leader>faf", function()
	require("telescope.builtin").find_files({ follow = true, hidden = true, no_ignore = true })
end, { desc = "Telescope find all files" })

-- gitsigns mappings
map("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Git Blame line" })

-- bufferline mappings
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab" })
map("n", "<Leader>x", "<cmd>bdelete<CR>", { desc = "Close current tab" })

-- markdown previewer mappings
map("n", "<leader>mdp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview Toggle" })

-- searchbox mappings
noremap("n", "/", require("searchbox").incsearch, { desc = "Search" })
noremap("n", "<C-f>", function()
	require("searchbox").replace({ confirm = "menu" })
end, { desc = "Search and Replace" })

-- copilot mappings
noremap("i", "<C-l>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Accept Copilot suggestion" })

-- toggleterm mappings
noremap({ "n", "t" }, "<M-i>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Floating Terminal", silent = true })
