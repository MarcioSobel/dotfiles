return {
	{
		"goolord/alpha-nvim",
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			-- source: https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-10234780
			local function getCharLen(s, pos)
				local byte = string.byte(s, pos)
				if not byte then
					return nil
				end
				return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
			end

			local function applyColors(logo, colors, logoColors)
				dashboard.section.header.val = logo

				for key, color in pairs(colors) do
					local name = "Alpha" .. key
					vim.api.nvim_set_hl(0, name, color)
					colors[key] = name
				end

				dashboard.section.header.opts.hl = {}
				for i, line in ipairs(logoColors) do
					local highlights = {}
					local pos = 0

					for j = 1, #line do
						local opos = pos
						local char_len = getCharLen(logo[i], opos + 1)
						if char_len then
							pos = pos + char_len
							local color_name = colors[line:sub(j, j)]
							if color_name then
								table.insert(highlights, { color_name, opos, pos })
							end
						end
					end

					table.insert(dashboard.section.header.opts.hl, highlights)
				end

				dashboard.section.buttons.val = {
					dashboard.button("SPC n f", "  New file", "<cmd>ene <CR>"),
					dashboard.button("SPC f f", "  Find file"),
					dashboard.button("SPC q q", "  Quit", "<cmd>qa<CR>"),
				}

				return dashboard.config
			end

			require("alpha").setup(applyColors({
				[[       ⠈⣷⣿⣿⣶⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⢰⣶⣷⣿⣿]],
				[[       ⠀⠹⣿⣿⣿⡄⠀⠈⠓⠦⣄⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠖⠊⠉⠀⣸⣿⣿⣽⠃]],
				[[       ⠀⠀⠘⣿⣿⣇⠀⠀⠀⠀⠀⠘⠶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⣿⣿⣿⠃⠀]],
				[[       ⠀⠀⠀⠈⢻⣿⠄⠀⠀⠀⠀⠀⠀⠈⠳⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠙⠁⠀⠀⠀⠀⠀⠀⡸⣿⠟⠁⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠁⢾⡄⠀⠀⠀⠀⠀⠀⠀⠈⠱⣦⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠁    ]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠉⠳⡄⠀⠀⠀⠀⠀⠀⠀⠈⠳⡆⣤⠴⠞⠛⠉⠉⠉⠉⠉⠉⠉⠳⠆⣤⣤⠞⠁⠀⠀⠀⠀⠀⠀⢀⣠⠖⠁⠀⠀    ]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢳⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⣠⣶⠖⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠖⠶⣦⡄⠀⠀⢈⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠾⠀⠀⢰⣿⣷⣀⣠⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣀⣠⣿⣿⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠈⠻⣍⡩⠜⠃⠀⠀⠀⠠⣤⡤⠀⠀⠀⠀⠹⠭⣉⠽⠏⠀⠀⠀⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⠀⢀⣤⠴⠴⣤⣠⣇⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣤⣤⣼⣀⡴⢴⢦⣄⠀⠀⠀⠀⠀⠀⠀]],
				[[       ⠀⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⢹⡁⣀⡀⠙⣱⡀⠀⠀⠀⠲⣄⣠⡴⠙⢒⣤⣤⠴⠂⠀⠀⠀⢠⡞⢁⣀⡀⢨⠃⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀]],
				[[                                                            ]],
				[[                          h  e  l  l  o  !                  ]],
			}, {
				["y"] = { fg = "#d8a657" },
				["b"] = { fg = "#d4be98" },
				["r"] = { fg = "#ea6962" },
			}, {
				[[       yyyyyyy                                       yyyyyyy]],
				[[        yyyyy yyyyy                              yyyyy yyyyy]],
				[[        yyyyy     yyy                          yyy     yyyy ]],
				[[         yyyyy     yyyyy                    yyyyyy    yyyy  ]],
				[[            yyy       yyy      yyyyyy     yyyy       yyy    ]],
				[[              yyy       yyyyyyyyyyyyyyyyyyyy      yyyy      ]],
				[[                 yyy                           yyyy         ]],
				[[                   yyyy                      yyy            ]],
				[[                     y                       yy             ]],
				[[                    yy                        yy            ]],
				[[                    y   bbbbb          bbbbb  yy            ]],
				[[                    y  bbb  b          b  bb  yy            ]],
				[[                    y  bbbbbb   bbb    bbbbb  yy            ]],
				[[              yyyyyyyrrr                    rrryyyyyy       ]],
				[[             yy    yyrrrrr   dddddddddd  rrrrrryy    y      ]],
				[[                                                            ]],
				[[                          y  y  y  y  y  y                  ]],
			}))
		end,
	},
}
