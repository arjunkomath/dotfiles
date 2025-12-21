local M = {}

M.on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "gf", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "gj", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "gk", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<D-.>", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "gcr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { 0 })
  end
end

return M
