-- In lsp attach function
local opt = { noremap = true, silent = true }
-- local on_attach = function(client, bufnr)
--   local bufferMap = vim.api.nvim_buf_set_keymap
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   require "lsp-format".on_attach(client)
--   bufferMap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
--   bufferMap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
--
--   bufferMap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
--   bufferMap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
--   bufferMap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
--   bufferMap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
--   bufferMap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
-- end

local on_attach = function(client, bufnr)
  local map = vim.api.nvim_buf_set_keymap
  map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
  map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
  map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
  map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
  map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
  map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
  map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
  map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
  map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
  map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
  server:setup(opts)
end)

-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local lspconfig = require'lspconfig'

-- local languageServers = {
--   'html',
--   'tsserver',
--   'cssls',
--   'eslint',
--   'jsonls',
--   'volar',
--   'rust_analyzer',
-- }

-- for _, server in ipairs(languageServers) do
--   require'lspconfig'[server].setup{
--     capabilities = capabilities,
--     on_attach = on_attach,
--   }
-- end

-- -- emmet config
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- lspconfig.emmet_ls.setup({
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
-- })
