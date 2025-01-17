return {
  -- dap for debug in neovim
  {
    "mfussenegger/nvim-dap",
    keys = {
    -- stylua: ignore start
    { "<F5>", function() require("dap").continue() end, desc = "continue" },
    { "<F17>", function() require("dap").terminate() end, desc = "terminate" },
    { "<F29>", function() require("dap").restart_frame() end, desc = "restart" },
    { "<F6>", function() require("dap").pause() end, desc = "pause" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
    { "<F21>", function() require("dap").set_breakpoint(vim.fn.input('breakpoint condition: ')) end, desc = "breakpoint condition" },
    { "<F10>", function() require("dap").step_over() end, desc = "step over" },
    { "<F11>", function() require("dap").step_into() end, desc = "step into" },
    { "<F23>", function() require("dap").step_out() end, desc = "step out" },
      -- stylua: ignore end
    },
  },
}
