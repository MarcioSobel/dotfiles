local map = vim.keymap.set

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

-- telescope mappings
map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files" })

-- gitsigns mappings
map("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Git Blame line" })

-- Bufferline mappings
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab" })
map("n", "<Leader>x", "<cmd>bdelete<CR>", { desc = "Close current tab" })
