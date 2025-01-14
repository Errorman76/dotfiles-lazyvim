local map = LazyVim.safe_keymap_set

-- basic
map({ "i", "t" }, "jk", "<C-\\><C-n>", { desc = "exit insert mode" })
