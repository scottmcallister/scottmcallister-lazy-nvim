return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Disable autocomplete by not setting the mappings for <Tab> and <S-Tab>
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = function(fallback)
          local copilot_keys = vim.fn["copilot#Accept"]()
          if copilot_keys ~= "" then
            vim.api.nvim_feedkeys(copilot_keys, "i", true)
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          fallback()
        end,
      })
    end,
  },
}
