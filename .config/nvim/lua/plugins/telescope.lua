return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = " ",
					entry_prefix = " ",
					sorting_strategy = "ascending",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						width = 0.87,
						height = 0.80,
					},
					mappings = {
						n = { ["q"] = require("telescope.actions").close },
					},
					-- default: { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},

				extensions_list = { "themes", "terms" },
				extensions = {
					["ui-select"] = {},
				},
			})

			telescope.load_extension("ui-select")
		end,
	},
}
