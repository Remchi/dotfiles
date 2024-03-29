require("telescope").setup({})
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fn", "<cmd>Telescope file_browser<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope file_browser path=%:p:h<cr>", { noremap = true })
