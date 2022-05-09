local wk = require("which-key")
local mappings = {
  q = {":q!<cr>", "退出" },
  Q = {":qa!<cr>", "退出所有" },
  w = {":wq<cr>", "保存并退出" },
  W = {":wqa<cr>", "保存退出所有" },
  E = {":e ~/.config/nvim/init.vim<cr>", "编辑init.vim" },
  L = {
    name = 'LSP',
    i = {':LspInfo<cr>', 'Lsp服务'}
  }
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
