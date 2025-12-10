local status, lspconfig = pcall(require, "mason-lspconfig")
if (not status) then return end

lspconfig.setup {
  automatic_installation = true
}
