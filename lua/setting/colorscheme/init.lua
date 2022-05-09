-- config dark gruvbox
vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
-- local colorscheme = "gruvbox"
-- local colorscheme = "dracula"
local colorscheme = "nightfox"
-- local colorscheme = "nextocan"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end
