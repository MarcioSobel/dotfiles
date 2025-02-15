## My Neovim config
Configs, mappings and lazy.nvim configs are in the `lua/config` directory.
Plugins and its configs are in `lua/plugins` directory.

I decided to make each plugin on its own file. Its easier to remove/add plugins and there is no need to jump around between the instalation and config files.

> [!NOTE]
> LSPs are automatically installed by [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim). All you need to do is call the server's setup and it will automatically be installed. LSP configuration can be adjusted on `plugins/lspconfig.lua`.
