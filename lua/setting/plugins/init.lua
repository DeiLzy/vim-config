local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }

    -- 兼容 参数 高亮
    use {
      'm-demare/hlargs.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    -- use 'dense-analysis/ale'

    use 'jose-elias-alvarez/null-ls.nvim'

    -- use {
    --   "folke/trouble.nvim",
    --   requires = "kyazdani42/nvim-web-devicons",
    --   config = function()
    --     require("trouble").setup {}
    --   end
    -- }


    use 'glepnir/dashboard-nvim'

    use "lukas-reineke/indent-blankline.nvim"

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup{
          current_line_blame = true
        }
      end
    }
    use 'nvim-lua/popup.nvim'

    use { 'tami5/lspsaga.nvim' }  -- nightly

    use 'terrortylor/nvim-comment'

    use 'norcalli/nvim-colorizer.lua'

    use 'L3MON4D3/LuaSnip'

    use 'mattn/emmet-vim'

    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'

    use 'windwp/nvim-autopairs'

    -- project
    use("ahmedkhalf/project.nvim")

    -- telescope （新增）
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

    -- bufferline (新增)
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer'

    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

    use("arkav/lualine-lsp-progress")

    use 'plasticboy/vim-markdown'

    use 'christoomey/vim-tmux-navigator'

    use 'akinsho/toggleterm.nvim'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

    -- theme
    use 'folke/tokyonight.nvim'
    use 'joshdick/onedark.vim'
    use 'sainnhe/sonokai'
    use 'mhartington/oceanic-next'

    use 'ryanoasis/vim-devicons'

    use 'Konfekt/FastFold'

    -- use 'f-person/git-blame.nvim'

    use 'github/copilot.vim'

    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'onsails/lspkind-nvim'
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
