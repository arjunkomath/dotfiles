local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

local core_modules = {
   "core.options",
   "core.autocmds",
   "core.mappings",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

-- non plugin mappings
require("core.mappings").misc()

-- check if custom init.lua file exists
if vim.fn.filereadable(vim.fn.stdpath "config" .. "/lua/custom/init.lua") == 1 then
   -- try to call custom init, if not successful, show error
   local ok, err = pcall(require, "custom")
   if not ok then
      vim.notify("Error loading custom/init.lua\n\n" .. err)
   end
   return
end

-- change leader to space
vim.g.mapleader = " "

local map = require("core.utils").map

-- open vim config file
map("n", "<leader>,", ":vsplit ~/.config/nvim/init.lua<CR>")
-- reload vim config
map("n", "<C-s>", ":source ~/.config/nvim/init.lua<CR>")

-- save file
map("n", "<leader>s", ":w<CR>")
-- close file
map("n", "<C-w>", ":bdelete<CR>")
-- close window
map("n", "<C-q>", ":qa<CR>")
-- resize buffer
map("n", "<C-left>", ":vertical resize +25<CR>")
map("n", "<C-right>", ":vertical resize -25<CR>")

-- search & files
-- toggle file explorer
map("n", "<leader>1", ":NvimTreeToggle<CR>")
map("n", "<leader><space>", ":Telescope find_files<CR>")
map("n", "<leader>f", ":Telescope live_grep<CR>")

-- smart esc
require('smart-term-esc').setup{
    key='<Esc>',
    except={'nvim', 'fzf'}
}
