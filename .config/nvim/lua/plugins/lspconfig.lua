return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lsp = require("lspconfig")

			local on_attach = function(_, bufnr)
				local map = vim.keymap.set

				local function opts(desc)
					return { buffer = bufnr, desc = "LSP " .. desc }
				end

				map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
				map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
				map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
				map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
				map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
				map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

				map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

				map("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts("List workspace folders"))

				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
				map("n", "gr", vim.lsp.buf.references, opts("Show references"))

				require("lsp_signature").setup({ bind = true }, bufnr)
			end

			local on_init = function(client, _)
				if client.supports_method("textDocument/semanticTokens") then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			}

			-- servers to be used with default configs
			local servers = { "ts_ls", "html", "cssls" }

			for _, server in ipairs(servers) do
				lsp[server].setup({
					on_attach = on_attach,
					on_init = on_init,
					capabilities = capabilities,
				})
			end

			-- custom configs for each server
			lsp.lua_ls.setup({
				on_attach = on_attach,
				on_init = on_init,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			lsp.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
					on_attach(client, bufnr)
				end,
				on_init = on_init,
				capabilities = capabilities,
			})

			lsp.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "rust" },
				root_dir = require("lspconfig.util").root_pattern("Cargo.toml"),
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
					},
				},
			})
		end,
	},
}
