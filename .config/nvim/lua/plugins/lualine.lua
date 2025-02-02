return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
			sections = {
				lualine_a = { { "mode", separator = { right = "" } } },
				lualine_b = {
					{ "branch", icon = "", separator = { right = "" } },
					"diagnostics",
				},
				lualine_c = { "filename" },
				lualine_x = {
					function()
						local clients = vim.lsp.get_active_clients()

						if not next(clients) then
							return ""
						end
					
						local client_names = {}
						for _, client in ipairs(clients) do
							table.insert(client_names, client.name)
						end
					
						return "󰣖 " .. table.concat(client_names, ", ")
					end,
				},
				lualine_y = { { "filetype", separator = { left = "" } } },
				lualine_z = { { "location", separator = { left = "" }, padding = { right = 1, left = 0 } } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
}
