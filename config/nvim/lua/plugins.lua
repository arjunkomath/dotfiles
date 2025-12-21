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
    cmd = "Trouble",
    opts = {},
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
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim',
    },
  },
  'nvim-telescope/telescope.nvim',
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      max_lines = 3,
      multiline_threshold = 1,
    },
  },
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
  'NvChad/nvim-colorizer.lua',
  'akinsho/nvim-bufferline.lua',
  'lewis6991/gitsigns.nvim',
  {
    'folke/zen-mode.nvim',
    lazy = true,
    cmd = "ZenMode",
  },
  {
    'folke/twilight.nvim',
    lazy = true,
  },
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    config = function()
      require('typescript-tools').setup({
        on_attach = function(client, bufnr)
          require('lsp-keymaps').on_attach(client, bufnr)
          vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<CR>", { buffer = bufnr })
        end,
      })
    end,
  },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  {
    'MagicDuck/grug-far.nvim',
    opts = {},
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<C-g>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'ray-x/go.nvim',
    lazy = true,
    ft = { "go", "gomod", "gowork", "gotmpl" },
    dependencies = {
      'ray-x/guihua.lua',
    },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require('go').setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        styles = {
          italic = true,
          bold = true,
        },
      })
      vim.cmd('colorscheme rose-pine')
    end,
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      set_dark_mode = function()
        vim.cmd('colorscheme rose-pine-main')
      end,
      set_light_mode = function()
        vim.cmd('colorscheme rose-pine-dawn')
      end,
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
