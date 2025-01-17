return {
  -- disalbe scroll animation
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },

  -- resize picker
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      winopts = {
        height = 0.95,
        width = 0.95,
      },
    },
  },
}
