local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local codeActions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

null_ls.setup({
  debug  = false,
  sources = {
    diagnostics.eslint.with({
     prefer_local = "node_modules/.bin",
    }),
    codeActions.eslint.with({
     prefer_local = "node_modules/.bin",
    }),
    completion.spell,
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
      },
      prefer_local = "node_modules/.bin",
    }),
    formatting.rustfmt,
    formatting.stylua,
  },
})
