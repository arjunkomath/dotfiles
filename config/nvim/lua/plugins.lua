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
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-go"),
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = "Trouble",
    keys = {
      { "tt", "<cmd>Trouble diagnostics toggle<cr>" },
      { "td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
    },
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'mbbill/undotree',
    lazy = true,
    cmd = "UndotreeToggle",
    keys = {
      { "<C-z>", "<cmd>UndotreeToggle<cr>" },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {}
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { {
            'filename',
            file_status = true,
            path = 0
          } },
          lualine_x = {
            { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
            'encoding',
            'filetype'
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { {
            'filename',
            file_status = true,
            path = 1
          } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { 'fugitive' }
      }
    end,
  },
  'nvim-lua/plenary.nvim',
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = { default = true },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('nvim-treesitter').setup()

      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      require('ts_context_commentstring').setup {
        enable = true,
        enable_autocmd = false,
      }

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = require('rainbow-delimiters').strategy['local'],
        },
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = "Telescope",
    keys = {
      { ';f', function() require('telescope.builtin').find_files({ no_ignore = false, hidden = true, previewer = false }) end },
      { ';r', function() require('telescope.builtin').live_grep() end },
      { '\\\\', function() require('telescope.builtin').buffers() end },
      { ';t', function() require('telescope.builtin').help_tags() end },
      { ';;', function() require('telescope.builtin').resume() end },
      { ';e', function() require('telescope.builtin').diagnostics() end },
      { ';s', function() require('telescope.builtin').lsp_document_symbols() end },
      { ';S', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end },
    },
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup {
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close,
              ["sd"] = actions.smart_send_to_qflist,
              ["p"] = function() vim.api.nvim_put({ vim.fn.getreg("+") }, "", true, true) end,
            },
          },
          file_ignore_patterns = { '.git/' },
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      max_lines = 3,
      multiline_threshold = 1,
    },
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>" },
    },
    opts = {
      default_file_explorer = true,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function()
      require('Comment').setup {
        pre_hook = function(ctx)
          if vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')
            local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
              location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
              location = require('ts_context_commentstring.utils').get_visual_start_location()
            end
            return require('ts_context_commentstring.internal').calculate_commentstring({
              key = type,
              location = location,
            })
          end
        end,
      }
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        css = true,
        css_fn = true,
        mode = "background",
        tailwind = true,
        virtualtext = "■",
      },
    },
  },
  {
    'akinsho/nvim-bufferline.lua',
    event = "VeryLazy",
    keys = {
      { '<Tab>', '<Cmd>BufferLineCycleNext<CR>' },
      { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>' },
    },
    opts = {
      options = {
        mode = "tabs",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        separator_style = "slant",
        themable = true,
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 300,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', ']c', function() gs.next_hunk() end)
        map('n', '[c', function() gs.prev_hunk() end)
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line({ full = true }) end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
      end
    },
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
    opts = {},
  },
  {
    'NeogitOrg/neogit',
    lazy = true,
    cmd = "Neogit",
    keys = {
      { "<C-g>", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
    },
    opts = {
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
  },
  {
    'folke/zen-mode.nvim',
    lazy = true,
    cmd = "ZenMode",
    keys = {
      { '<leader>z', '<cmd>ZenMode<cr>', silent = true },
    },
    opts = {
      plugins = {
        twilight = { enabled = true },
      },
    },
  },
  {
    'folke/twilight.nvim',
    lazy = true,
  },
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local lsp_attach = require('lsp-keymaps').on_attach

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.HINT] = 'H',
            [vim.diagnostic.severity.INFO] = 'I',
          }
        }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              on_attach = lsp_attach,
              capabilities = capabilities,
            })
          end,
          ['ts_ls'] = function() end,
          ['gopls'] = function() end,
        }
      })
    end,
  },
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
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = 'copilot' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lua' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },
  {
    'MagicDuck/grug-far.nvim',
    lazy = true,
    cmd = "GrugFar",
    keys = {
      { "<Space><Space>", "<cmd>GrugFar<cr>" },
      { "<C-f>", function() require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } }) end },
    },
    opts = {},
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", event = { "BufReadPost", "BufNewFile" }, opts = {} },
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
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
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
          neogit = true,
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
    event = "BufWritePre",
    cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
    keys = {
      { "<leader>f", function() require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 }) end, mode = { "n", "v" } },
    },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "oxfmt", "biome", stop_after_first = true },
          typescript = { "oxfmt", "biome", stop_after_first = true },
          javascriptreact = { "oxfmt", "biome", stop_after_first = true },
          typescriptreact = { "oxfmt", "biome", stop_after_first = true },
          json = { "oxfmt", "biome", stop_after_first = true },
          jsonc = { "oxfmt", "biome", stop_after_first = true },
          css = { "oxfmt", "biome", stop_after_first = true },
        },
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_fallback = true }
        end,
      })

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    end,
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
    event = "InsertEnter",
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
      { "r", mode = "o", function() require("flash").remote() end },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
      { "<leader>1", function() require("harpoon"):list():select(1) end },
      { "<leader>2", function() require("harpoon"):list():select(2) end },
      { "<leader>3", function() require("harpoon"):list():select(3) end },
      { "<leader>4", function() require("harpoon"):list():select(4) end },
      { "<C-S-P>", function() require("harpoon"):list():prev() end },
      { "<C-S-N>", function() require("harpoon"):list():next() end },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({
        settings = {
          save_on_toggle = true,
        },
      })

      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })
          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })
        end,
      })
    end,
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
