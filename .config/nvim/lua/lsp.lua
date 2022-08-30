local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "julials", "pyright", "clangd", "asm_lsp" }
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

mason_lspconfig.setup_handlers({
    function(server_name) -- Default handler
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
    end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Tells Lua that a global variable named vim exists to not have warnings when configuring neovim
            globals = { "vim" },
          },
        },
      },
    })
  end,
})
