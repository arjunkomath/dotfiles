require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
  term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,              -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,            -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,              -- Force no italic
  no_bold = false,                -- Force no bold
  no_underline = false,           -- Force no underline
  styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },      -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    all = {
      base = "#000000",
      -- rosewater = "#f5e0dc",
      -- flamingo = "#f2cdcd",
      -- pink = "#f5c2e7",
      -- mauve = "#cba6f7",
      -- red = "#E34234",
      maroon = "#DD4F7D",
      -- peach = "#fab387",
      yellow = "#FAC760",
      -- green = "#a6e3a1",
      teal = "#5BD1B9",
      -- sky = "#89dceb",
      -- sapphire = "#74c7ec",
      -- blue = "#A7D1F5",
      -- lavender = "#D7C9F0",
      -- text = "#cdd6f4",
      -- subtext1 = "#bac2de",
      -- subtext0 = "#a6adc8",
      -- overlay2 = "#9399b2",
      -- overlay1 = "#7f849c",
      -- overlay0 = "#6c7086",
      -- surface2 = "#585b70",
      -- surface1 = "#45475a",
      -- surface0 = "#313244",
      -- mantle = "#181825",
      -- crust = "#11111b",
    },
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    telescope = {
      enabled = true,
      -- style = "nvchad",
    },
    dropbar = {
      enabled = true,
      color_mode = true,
    },
  },
})

vim.cmd.colorscheme "catppuccin"
