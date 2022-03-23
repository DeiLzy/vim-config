require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript", "html", "css","typescript", "vue", "rust", "solidity", "tsx", "lua"},
  
  ignore_install = { "php", "phpDoc" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
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
