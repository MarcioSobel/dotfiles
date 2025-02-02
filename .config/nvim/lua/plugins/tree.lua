local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {
			desc = desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	vim.keymap.set("n", "<C-n>", api.tree.open, opts("Open or Focus File Explorer"))
	vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Toggle File Explorer"))
	api.config.mappings.default_on_attach(bufnr)
end

return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local function opts(desc)
				return {
					desc = desc,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			local api = require("nvim-tree.api")
			vim.keymap.set("n", "<C-n>", api.tree.open, opts("Open or Focus File Explorer"))
			vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Toggle File Explorer"))

			local HEIGHT_RATIO = 0.7
			local WIDTH_RATIO = 0.2

			require("nvim-tree").setup({
				on_attach = my_on_attach,
				live_filter = {
					prefix = " ",
					always_show_folders = false,
				},
				filters = {
					custom = { "^\\.git" },
				},
				view = {
					side = "left",
					width = function()
						return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
					end,
					float = {
						enable = false, -- change to true to use floating tree
						open_win_config = function()
							local screen_w = vim.opt.columns:get()
							local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
							local window_w = screen_w * WIDTH_RATIO
							local window_h = screen_h * HEIGHT_RATIO
							local window_w_int = math.floor(window_w)
							local window_h_int = math.floor(window_h)
							local center_x = (screen_w - window_w) / 2
							local center_y = ((vim.opt.lines:get() - window_h) / 2 - vim.opt.cmdheight:get())
							return {
								border = "rounded",
								relative = "editor",
								row = center_y,
								col = center_x,
								width = window_w_int,
								height = window_h_int,
							}
						end,
					},
				},
			})
		end,
	},
}
