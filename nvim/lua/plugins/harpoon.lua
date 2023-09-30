return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>hf",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Mark a file",
      },
      {
        "<leader>hm",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle quick menu",
      },
      {
        "<leader>ht",
        "<cmd>Telescope harpoon marks<cr>",
        desc = "Telescope marks",
      },
    },
    config = function()
      require("harpoon").setup({})
      require("telescope").load_extension("harpoon")
    end,
  },
}
