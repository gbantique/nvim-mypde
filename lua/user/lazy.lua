local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Which Key
  { "folke/which-key.nvim" },
  { 'ellisonleao/gruvbox.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'dracula/vim', lazy = false },
  -- Alpha
  { 'goolord/alpha-nvim', },
  -- Color scheme
  { 'rose-pine/neovim', name = 'rose-pine' },
  -- Barbar bufferline
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
  },

  { "akinsho/toggleterm.nvim" },

  { "windwp/nvim-autopairs", }, -- Autopairs, integrates with both cmp and treesitter

  { "windwp/nvim-ts-autotag", }, -- Autotagging

  { "lukas-reineke/indent-blankline.nvim" },

  { "NvChad/nvim-colorizer.lua" },

  -- Nvim-Surround (Manipulating Surroundings)
  { 'kylechui/nvim-surround', },

  -- Git related plugins
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  { 'lewis6991/gitsigns.nvim' },

  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'bluz71/vim-nightfly-colors' },
  { 'vim-test/vim-test' },
  { 'lewis6991/gitsigns.nvim' },
  { 'preservim/vimux' },
  { 'christoomey/vim-tmux-navigator' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-commentary' },
  { "b0o/schemastore.nvim" },
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'jay-babu/mason-null-ls.nvim' },

  -- rust babyyyyyyy
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  { 'simrat39/rust-tools.nvim' },

  -- LSP-ZERO
  { 'VonHeikemen/lsp-zero.nvim', },
  -- LSP Support
  {"neovim/nvim-lspconfig"},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"onsails/lspkind.nvim"},
  -- Autocompletion
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"saadparwaiz1/cmp_luasnip"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-nvim-lua"},
  -- Snippets
  {"L3MON4D3/LuaSnip"},
  {"rafamadriz/friendly-snippets"},

  -- LSP
  { "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },
  {
	  'nvim-telescope/telescope.nvim',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require("fidget").setup {
        -- options
      }
    end,
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
