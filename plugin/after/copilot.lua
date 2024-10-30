local copilot_on = true

vim.api.nvim_create_user_command("CopilotToggle", function()
  if copilot_on then
    vim.cmd("Copilot disable")
    print("Copilot OFF")
  else
    vim.cmd("Copilot enable")
    print("Copilot ON")
  end
  copilot_on = not copilot_on
end, { nargs = 0 })

vim.keymap.set("n", "<leader>ct", ":CopilotToggle<CR>", { noremap = true, silent = true })

-- open copilot chat
vim.keymap.set("n", "<leader>cc", vim.cmd.CopilotChat)
vim.keymap.set("v", "<leader>cc", vim.cmd.CopilotChat)
