local wk = require("which-key")
local mappings = {
  q = {":qa<cr>", "退出所有" },
  w = {":wqa<cr>", "保存并退出所有" },
  E = {":e ~/.config/nvim/init.vim<cr>", "编辑init.vim" }
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
