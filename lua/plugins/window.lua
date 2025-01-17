return {
  -- resize pane
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      -- stylua: ignore start
      { "<A-Up>", function() require("smart-splits").resize_up() end, "n", desc = "resize window(up)" },
      { "<A-Down>", function() require("smart-splits").resize_down() end, "n", desc = "resize window(down)" },
      { "<A-Left>", function() require("smart-splits").resize_left() end, "n", desc = "resize window(left)" },
      { "<A-Right>", function() require("smart-splits").resize_right() end, "n", desc = "resize window(right)" },
      -- stylua: ignore end
    },
    config = function()
      -- remove default keymap(lazyvim) that resize pane
      vim.keymap.del("n", "<C-Up>")
      vim.keymap.del("n", "<C-Down>")
      vim.keymap.del("n", "<C-Left>")
      vim.keymap.del("n", "<C-Right>")
    end,
  },

  -- move pane
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
