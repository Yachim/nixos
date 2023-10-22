-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require'lspconfig'.gdscript.setup{capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())}
