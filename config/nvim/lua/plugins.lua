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
      'nvim-neotest/neotest-go',
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
      require('go').setup({
        lsp_cfg = {
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = true,
              analyses = {
                unusedparams = true,
                shadow = true,
                nilness = true,
                unusedwrite = true,
                useany = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        lsp_on_attach = require('lsp-keymaps').on_attach,
        lsp_keymaps = false,
        lsp_inlay_hints = { enable = true },
      })

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimports()
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
    },
    opts = {},
  },
  {
    'sphamba/smear-cursor.nvim',
    cond = not vim.g.neovide,
    opts = {},
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        integrations = {
          bufferline = true,
          cmp = true,
          colorizer = true,
          diffview = true,
          dressing = true,
          gitsigns = true,
          harpoon = true,
          indent_blankline = { enabled = true },
          lualine = true,
          mason = true,
          native_lsp = {
            enabled = true,
            inlay_hints = { background = true },
          },
          neotest = true,
          notify = true,
          rainbow_delimiters = true,
          render_markdown = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          lsp_trouble = true,
          which_key = true,
          zen_mode = true,
        }
      })
      vim.cmd('colorscheme catppuccin-mocha')
    end,
  },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      set_dark_mode = function()
        vim.cmd('colorscheme catppuccin-mocha')
      end,
      set_light_mode = function()
        vim.cmd('colorscheme catppuccin-latte')
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
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>mr', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle markdown render' },
      { '<leader>mp', '<cmd>RenderMarkdown preview<cr>', desc = 'Markdown preview' },
    },
    opts = {},
  },
}
