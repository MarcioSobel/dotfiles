return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers",
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
