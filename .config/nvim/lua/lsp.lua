local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "rust_analyzer", "gopls", "julials", "pyright", "clangd", "asm_lsp" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers({
    function(server_name) -- Default handler
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
    end,
})
