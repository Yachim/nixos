return {
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      local wk = require("which-key")
      opts.defaults["<leader>h"] = { name = "+harpoon" }
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
