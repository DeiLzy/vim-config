-- In lsp attach function
local opts = { noremap = true, silent = true }

local ts_utils = require("nvim-lsp-ts-utils")

local Lspsaga = require 'lspsaga'

local buf_map = function(bufnr, mode, lhs, rhs, opt)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opt or {
    silent = true,
    noremap = true,
  })
end

local on_attach = function(client, bufnr)
  require "lsp-format".on_attach(client)
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  -- vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.format()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  -- vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRename Lspsaga rename")
  vim.cmd("command! LspsagaHover Lspsaga hover_doc")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  buf_map(bufnr, "n", "gd", ":LspDef<CR>")
  buf_map(bufnr, "n", "gi", ":LspRefs<CR>")
  buf_map(bufnr, "n", "gr", ":LspRename<CR>")
  buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
  buf_map(bufnr, "n", "gh", ":LspsagaHover<CR>")

  buf_map(bufnr, "n", "K", ":LspHover<CR>")
  buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
  buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
  buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
  buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

  -- disable lsp format
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  -- doc
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end

  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  vim.cmd [[cabbrev w execute "lua vim.lsp.buf.formatting_seq_sync()" <bar> w]]
  vim.cmd [[cabbrev wq execute "lua vim.lsp.buf.formatting_seq_sync()" <bar> wq]]

  -- 增强ts
  ts_utils.setup({
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,
    -- import all
    import_all_timeout = 5000, -- ms
    -- lower numbers = higher priority
    import_all_priorities = {
      same_file = 1, -- add to existing import statement
      local_files = 2, -- git files or files with relative path markers
      buffer_content = 3, -- loaded buffer content
      buffers = 4, -- loaded buffer names
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,
    -- if false will avoid organizing imports
    always_organize_imports = true,
    -- filter diagnostics
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},
    -- inlay hints
    auto_inlay_hints = true,
    inlay_hints_highlight = "Comment",
    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,
  })
  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)
  -- 绑定增强插件快捷键
  -- no default maps, so you may want to define some here
  
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
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
