require("nvim-tree").setup()

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>")
