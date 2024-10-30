-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

-- move selected text and keep it selected
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- shift highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep curor in middle when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without losing the buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- move selected text and keep it selected
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- swap between windows
vim.api.nvim_set_keymap("n", "<leader><TAB>", "<C-w>w", {})
vim.api.nvim_set_keymap("n", "<leader><S-TAB>", "<C-w>W", {})

-- toggle relative number
vim.api.nvim_set_keymap("n", "<leader>l", ":lua ToggleRelativeNumber()<CR>", { noremap = true, silent = true })

function ToggleRelativeNumber()
  if vim.wo.relativenumber == true then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

vim.keymap.set("i", "<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, {
  silent = true,
})
