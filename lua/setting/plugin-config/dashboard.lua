

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "人生南北多歧路，将相神仙也要凡人做"}

vim.g.dashboard_custom_section = {
  a = { description = {"😋 同步插件          " }, command = "PackerSync" },
  b = { description = {"  项目              " }, command = "Telescope projects" },
  c = { description = {"  最近文件          " }, command = "Telescope oldfiles" },
  e = { description = {"  编辑项目列表      " }, command = "edit ~/.local/share/nvim/project_nvim/project_history", },
  f = { description = {"  键位              " }, command = "edit ~/.config/nvim/lua/setting/keybindings/init.lua" },
  h = { description = {"  更换主题          " }, command = 'Telescope colorscheme'},
}

vim.g.dashboard_custom_header = {
[[ ██████╗  ██████╗  ██████╗ ██████╗ ███████╗ ]],
[[ ██╔═══██╗██╔═══██╗██╔═══██╗██╔══██╗██╔════╝ ]],
[[ ██║   ██║██║   ██║██║   ██║██████╔╝███████╗ ]],
[[ ██║   ██║██║   ██║██║   ██║██╔═══╝ ╚════██║ ]],
[[ ╚██████╔╝╚██████╔╝╚██████╔╝██║     ███████║ ]],
[[ ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝ ]],
}
