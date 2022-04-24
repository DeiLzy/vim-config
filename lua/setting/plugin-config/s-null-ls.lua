local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local codeActions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

null_ls.setup({
  debug  = false,
  sources = {
    diagnostics.eslint.with({}),
    codeActions.eslint.with({}),
    completion.spell,
    formatting.prettier,
    formatting.rustfmt,
  },
})
