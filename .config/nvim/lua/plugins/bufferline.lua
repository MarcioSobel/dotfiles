return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers",
				separator_style = "slope",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return icon .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = true,
					},
				},
			},
		},
	},
}
