local wk = require("which-key")
local mappings = {
  qa = {":qa!<cr>", "退出所有" },
  w = {":wqa<cr>", "保存并退出所有" },
  E = {":e ~/.config/nvim/init.vim<cr>", "编辑init.vim" },
  l = {":lua require('nvim-treesitter').refresh_highlights()<cr>", "刷新代码高亮" },
  L = {
    name = 'LSP',
    i = {':LspInfo<cr>', 'Lsp服务'}
  }
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
