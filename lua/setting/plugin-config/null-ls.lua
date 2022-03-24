local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
-- local action = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.gofmt,
    formatting.shfmt,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }), 
    formatting.isort, 
    formatting.codespell.with({filetypes = {'markdown'}})
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end
})
