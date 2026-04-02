return {
  "github/copilot.vim",
  config = function()
    -- Optional: Configuration goes here
    -- For example, to disable copilot for specific filetypes:
    vim.g.copilot_filetypes = {
      ["*"] = true,
      ["gitcommit"] = false,
    }
  end,
}
