return {
  {
    'rcarriga/nvim-notify',
    lazy = false,
    priority = 100,
    config = function()
      local notify = require('notify')
      notify.setup({
        stages = "fade",
        timeout = 3000,
        background_colour = "#000000",
      })
      vim.notify = notify
    end
  },
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    opts = {
      select = {
        backend = { "telescope", "builtin" },
      },
    },
  },
  {
    'nvim-neotest/neotest',
    lazy = true,
    cmd = "Neotest",
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show output" },
    },
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'marilari88/neotest-vitest',
    },
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'mbbill/undotree',
    lazy = true,
    cmd = "UndotreeToggle",
  },
  'nvim-lualine/lualine.nvim', -- Statusline
  'nvim-lua/plenary.nvim',     -- Common utilities
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  'nvim-telescope/telescope.nvim',
  'wellle/context.vim',
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  'norcalli/nvim-colorizer.lua',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  {
    'f-person/git-blame.nvim',
    lazy = true,
    cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameDisable" },
    config = function()
      require('gitblame').setup()
    end
  },
  {
    'folke/zen-mode.nvim',
    lazy = true,
    cmd = "ZenMode",
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  'nvim-pack/nvim-spectre',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  -- Language tools
  {
    'simrat39/rust-tools.nvim',
    lazy = true,
    ft = "rust",
  },
  {
    'ray-x/go.nvim',
    lazy = true,
    ft = "go",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      vim.cmd('colorscheme github_dark_default')
    end,
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      set_dark_mode = function()
        vim.cmd('colorscheme github_dark_default')
      end,
      set_light_mode = function()
        vim.cmd('colorscheme github_light')
      end,
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  'github/copilot.vim',
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
