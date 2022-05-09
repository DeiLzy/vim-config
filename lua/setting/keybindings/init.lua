local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
local opt = {noremap = true, silent = true }

-- 全文缩进
map('n', '<leader>de', 'gg=G<C-o>', opt)


map("i", "jk", "<ESC>", opt)
map("i", "kj", "<ESC>", opt)

-- 屏幕 相关
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- nvim-tree
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- map("n", "<leader>r", ":NvimTreeRefresh<CR>", opt)
-- map("n", "<leader>n", ":NvimTreeFindFile<CR>", opt)
-- map("n", "<leader>f", ":NvimTreeFocus<CR>", opt)

-- neo-tree
map("n", "<leader>e", ":Neotree<CR>", opt)
-- 打开焦点不离开当前
map("n", "<leader>e", ":Neotree show<CR>", opt)
-- 打开并且聚焦文件栏
map("n", "<leader>f", ":Neotree focus<CR>", opt)
-- 关闭
map("n", "<leader>c", ":Neotree close<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)

-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "˙", "<C-w>h", opt)
map("n", "∆", "<C-w>j", opt)
map("n", "˚", "<C-w>k", opt)
map("n", "¬", "<C-w>l", opt)

-- 左右比例控制
-- map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
-- map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)

-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

-- 等比例
map("n", "s=", "<C-w>=", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- bufferline
-- 左右buffer切换
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>l", ":BufferLineCycleNext<CR>", opt)-- 关闭

--  选择buffer
map("n", "<leader>p", ":BufferLinePick<CR>", opt)


--"moll/vim-bbye"
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


-- eslint fix all
map("n", "<leader>s", ":EslintFixAll<CR>", opt)

-- Telescope 列表中 插入模式快捷键
telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}


-- Map compe confirm and complete functions
-- map('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
-- map('i', '<c-space>', 'compe#complete()', { expr = true })

-- Trouble
-- map("n", "<leader>xx", "<cmd>Trouble<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
--   {silent = true, noremap = true}
-- )
-- map("n", "gR", "<cmd>Trouble lsp_references<cr>",
--   {silent = true, noremap = true}
-- )
