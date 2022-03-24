

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_footer = { "人生南北多歧路，将相神仙也要凡人做"}

vim.g.dashboard_custom_section = {
  a = { description = {"  项目              " }, command = "Telescope projects" },
  b = { description = {"  最近文件          " }, command = "Telescope oldfiles" },
  c = { description = {"  编辑项目列表      " }, command = "edit ~/.local/share/nvim/project_nvim/project_history", },
  d = { description = {"  键位              " }, command = "edit ~/.config/nvim/lua/setting/keybindings/init.lua" },
  e = { description = {"  更换主题          " }, command = 'Telescope colorscheme'},
}

vim.g.dashboard_custom_header = {
[[ ██████╗  ██████╗  ██████╗ ██████╗ ███████╗ ]],
[[ ██╔═══██╗██╔═══██╗██╔═══██╗██╔══██╗██╔════╝ ]],
[[ ██║   ██║██║   ██║██║   ██║██████╔╝███████╗ ]],
[[ ██║   ██║██║   ██║██║   ██║██╔═══╝ ╚════██║ ]],
[[ ╚██████╔╝╚██████╔╝╚██████╔╝██║     ███████║ ]],
[[ ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝     ╚══════╝ ]],
}
