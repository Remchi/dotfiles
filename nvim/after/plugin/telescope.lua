require("telescope").setup({})
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("frecency")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fn", "<cmd>Telescope file_browser<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope file_browser path=%:p:h<cr>", { noremap = true })

vim.keymap.set(
	"n",
	"<leader>fq",
	"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
	{ noremap = true, silent = true }
)
