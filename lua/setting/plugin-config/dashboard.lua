

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { ""}

vim.g.dashboard_custom_section = {
  a = { description = {"P-Sync              " }, command = "PackerSync" },
  b = { description = {"F-Recent            " }, command = "Telescope oldfiles" },
  f = { description = {"S-Keys              " }, command = "edit ~/.config/nvim/lua/setting/keybindings/init.lua" },
  h = { description = {"S-Theme             " }, command = 'Telescope colorscheme'},
}

vim.g.dashboard_custom_header = {
[[ ██████╗  ██████╗  ██████╗ ██████╗ ███████╗ ]],
[[ ██╔═══██╗██╔═══██╗██╔═══██╗██╔══██╗██╔════╝ ]],
[[ ██║   ██║██║   ██║██║   ██║██████╔╝███████╗ ]],
[[ ██║   ██║██║   ██║██║   ██║██╔═══╝ ╚════██║ ]],
[[ ╚██████╔╝╚██████╔╝╚██████╔╝██║     ███████║ ]],
[[ ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝ ]],
}
