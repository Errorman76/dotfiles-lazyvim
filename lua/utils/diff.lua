local M = {}

--- Display a diff between the current buffer and a given file
--- @param file string The file to diff against the current buffer
function M.diff_file(file)
  local pos = vim.fn.getpos(".")
  local current_file = vim.fn.expand("%:p")
  vim.cmd("edit " .. file)
  vim.cmd("vert diffsplit " .. current_file)
  vim.fn.setpos(".", pos)
end

--- Display a diff between a file at a given commit and the current buffer
--- @param commit string The commit hash
--- @param file_path string The file path
function M.diff_file_from_history(commit, file_path)
  local extension = vim.fn.fnamemodify(file_path, ":e") == "" and "" or "." .. vim.fn.fnamemodify(file_path, ":e")
  local temp_file_path = os.tmpname() .. extension

  local cmd = { "git", "show", commit .. ":" .. file_path }
  local out = M.get_cmd_output(cmd)

  M.write_to_file(temp_file_path, out)
  M.diff_file(temp_file_path)
end

--- Open a telescope picker to select a file to diff against the current buffer
--- @param recent? boolean If true, open the recent files picker
function M.telescope_diff_file(recent)
  local picker = require("telescope.builtin").find_files
  if recent then
    picker = require("telescope.builtin").oldfiles
  end

  picker({
    prompt_title = "Select File to Compare",
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        M.diff_file(selection.value)
      end)
      return true
    end,
  })
end

--- Open a telescope picker to select a commit to diff against the current buffer
function M.telescope_diff_from_history()
  local current_file = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:."):gsub("\\", "/")
  require("telescope.builtin").git_commits({
    git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit", "--follow", "--", current_file },
    attach_mappings = function(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        M.diff_file_from_history(selection.value, current_file)
      end)
      return true
    end,
  })
end

--- diff with clipboard
function M.diff_from_clipboard()
  local ftype = vim.api.nvim_eval("&filetype")
  vim.cmd("vsplit")
  vim.cmd("enew")
  vim.cmd("normal! P")
  vim.cmd("setlocal buftype=nowrite")
  vim.cmd("set filetype=" .. ftype)
  vim.cmd("diffthis")
  vim.cmd([[execute "normal! \<C-w>h"]])

  vim.cmd("normal! gv")
  vim.cmd("'<,'>y")
  vim.cmd("enew")
  vim.cmd("normal! P")
  vim.cmd("setlocal buftype=nowrite")
  vim.cmd("set filetype=" .. ftype)
  vim.cmd("diffthis")
end

return M
