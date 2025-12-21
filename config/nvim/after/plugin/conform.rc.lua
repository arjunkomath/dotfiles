local conform = require("conform")
local util = require("conform.util")

local function has_config(configs)
  local root_dir = vim.fn.getcwd()
  for _, config in ipairs(configs) do
    if vim.fn.filereadable(root_dir .. "/" .. config) == 1 then
      return true
    end
  end
  return false
end

local function get_formatter()
  if has_config({ "biome.json", "biome.jsonc" }) then
    return "biome"
  elseif has_config({ ".oxfmtrc.jsonc" }) then
    return "oxfmt"
  end
  return nil
end

conform.setup({
  formatters = {
    oxfmt = {
      command = util.from_node_modules("oxfmt"),
      args = { "--stdin-filepath", "$FILENAME" },
      stdin = true,
    },
  },
  formatters_by_ft = {
    javascript = { "biome", "oxfmt", stop_after_first = true },
    typescript = { "biome", "oxfmt", stop_after_first = true },
    javascriptreact = { "biome", "oxfmt", stop_after_first = true },
    typescriptreact = { "biome", "oxfmt", stop_after_first = true },
    json = { "biome" },
    jsonc = { "biome" },
    css = { "biome" },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    local formatter = get_formatter()
    if formatter then
      return { timeout_ms = 500, lsp_fallback = false, formatters = { formatter } }
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
})

-- Add commands to toggle formatting
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
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