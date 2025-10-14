local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gf", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "ga", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "gj", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "gk", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "gca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "gcr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(true, { 0 })
  end
end

lsp_zero.extend_lspconfig({
  sign_text = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  },
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'rust_analyzer' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

vim.diagnostic.config({
  virtual_text = true
})
