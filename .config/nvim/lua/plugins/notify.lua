return {
	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 60,
			render = "compact",
			stages = "slide",
			top_down = false,
		},
		config = function(_, opts)
			local notify = require("notify")
			vim.notify = notify
			notify.setup(opts)
		end,
	},
}
