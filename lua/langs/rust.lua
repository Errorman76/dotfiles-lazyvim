return {
  {
    "nvim-neotest/neotest",
    optional = true,
    opts = {
      adapters = {
        ["rustaceanvim.neotest"] = {
          -- TODO:
          -- set options for test
        },
      },
    },
  },
}
