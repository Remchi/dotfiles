require("hop").setup()
local hop = require("hop")

vim.keymap.set("", "s", function()
	hop.hint_char1({})
end, { remap = true })
