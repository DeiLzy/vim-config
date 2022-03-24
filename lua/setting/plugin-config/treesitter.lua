require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript", "html", "css","typescript", "vue", "rust", "solidity", "tsx", "lua"},

  ignore_install = { "php", "phpDoc" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false, 
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autopair = {
    enable = true,
    disable_inside_parens = false,
    style = "always_close",
  },
}

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
vim.opt.foldlevel = 99

