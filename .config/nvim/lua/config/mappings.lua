local map = vim.keymap.set

-- disable accidentally quitting neovim :sob:
map("n", "Q", "<nop>")

-- center screen when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- use this to paste without overwritting
-- your current paste buffer
map("x", "<leader>p", '"_dP', { desc = "Paste without overwritting current buffer" })

-- same but with delete
map("n", "<leader>d", '"_d', { desc = "Delete without overwritting current buffer" })
map("v", "<leader>d", '"_d', { desc = "Delete without overwritting current buffer" })

-- copy to system clipboard
map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })

-- comments
map("n", "<leader>/", "gcc", { desc = "Toggle comment" })
map("v", "<leader>/", "gc", { desc = "Toggle comment" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- file manipulation
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer changes to file" })

-- telescope mappings
map("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Telescope git status" })
map("n", "<leader>gcb", require("telescope.builtin").git_branches, { desc = "Telescope git branches" })
map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
map("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Telescope LSP diagnostics" })
map("n", "<C-f>", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Telescope find in current buffer" })
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({ follow = true })
end, { desc = "Telescope find files" })
map("n", "<leader>fa", function()
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
