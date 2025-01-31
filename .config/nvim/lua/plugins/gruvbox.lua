return {
	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		terminal_colors = true,
		lazy = false,
		config = function()
		  vim.g.gruvbox_material_foreground = "material"
		  vim.g.gruvbox_material_background = "soft"

		  vim.g.gruvbox_material_better_performance = 1
		  vim.cmd([[colorscheme gruvbox-material]])
		end,
	}
}
