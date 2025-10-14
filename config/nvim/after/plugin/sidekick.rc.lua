require("sidekick").setup({
  nes = {
    enabled = true,
    debounce = 100
  },
  cli = {
    mux = {
      backend = "zellij",
      enabled = true
    }
  }
})

vim.keymap.set("n", "<leader>aa", function() require("sidekick.cli").toggle() end, { desc = "Toggle Sidekick CLI" })
vim.keymap.set("n", "<leader>as", function() require("sidekick.cli").select() end, { desc = "Select Sidekick Tool" })
vim.keymap.set({ "n", "t", "i", "v" }, "<c-.>", function() require("sidekick.cli").toggle() end, { desc = "Toggle Sidekick" })
vim.keymap.set({ "n", "i" }, "<tab>", function()
  if not require("sidekick").nes_jump_or_apply() then
    return "<Tab>"
  end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })
