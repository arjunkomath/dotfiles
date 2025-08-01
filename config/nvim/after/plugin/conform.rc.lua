local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "biome", "prettier", stop_after_first = true },
    typescript = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", stop_after_first = true },
    json = { "biome", "prettier", stop_after_first = true },
    jsonc = { "biome", "prettier", stop_after_first = true },
    css = { "biome", "prettier", stop_after_first = true },
    scss = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    ["markdown.mdx"] = { "prettier" },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    
    -- Detect which formatter to use based on config files
    local root_dir = vim.fn.getcwd()
    local biome_configs = {
      "biome.json",
      "biome.jsonc",
    }
    local prettier_configs = {
      ".prettierrc",
      ".prettierrc.json",
      ".prettierrc.yml",
      ".prettierrc.yaml",
      ".prettierrc.js",
      ".prettierrc.cjs",
      ".prettierrc.mjs",
      "prettier.config.js",
      "prettier.config.cjs",
      "prettier.config.mjs",
    }
    
    local has_biome = false
    local has_prettier = false
    
    -- Check for biome config
    for _, config in ipairs(biome_configs) do
      if vim.fn.filereadable(root_dir .. "/" .. config) == 1 then
        has_biome = true
        break
      end
    end
    
    -- Check for prettier config
    for _, config in ipairs(prettier_configs) do
      if vim.fn.filereadable(root_dir .. "/" .. config) == 1 then
        has_prettier = true
        break
      end
    end
    
    -- If we have biome config, prefer biome
    if has_biome then
      return { timeout_ms = 500, lsp_fallback = false, formatters = { "biome" } }
    elseif has_prettier then
      return { timeout_ms = 500, lsp_fallback = false, formatters = { "prettier" } }
    else
      -- Fall back to LSP formatting
      return { timeout_ms = 500, lsp_fallback = true }
    end
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