local ls = require("luasnip")
local s = ls.snippet

local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt

vim.keymap.set({ "i", "s" }, "<C-l>", "<Plug>luasnip-expand-or-jump")
vim.keymap.set({ "i", "s" }, "<S-C-l>", "<cmd>lua require('luasnip').jump(-1)<cr>")

ls.setup({
	enable_autosnippets = true,
})

ls.add_snippets("elixir", {
	s({ trig = "%%", snippetType = "autosnippet" }, { t("<%= "), i(1), t(" %>") }),
	s({ trig = "%if", snippetType = "autosnippet" }, { t("<%= if "), i(1), t(" do %>") }),
	s({ trig = "%end", snippetType = "autosnippet" }, { t("<% end %> ") }),
	s(
		{ trig = "lvevent", snippetType = "autosnippet" },
		fmt(
			[[
    def handle_event("{}", {}, socket) do
      {{:noreply, socket}}{}
    end
    ]],
			{
				i(1, "event_name"),
				i(2, "_params"),
				i(0),
			}
		)
	),

	s(
		{ trig = "lvinfo", snippetType = "autosnippet" },
		fmt(
			[[
    def handle_info({{:{}, {}}}, socket) do
      {{:noreply, socket}}{}
    end
    ]],
			{
				i(1, "event_name"),
				i(2, "data"),
				i(0),
			}
		)
	),

	s(
		{ trig = "lvmount", snippetType = "autosnippet" },
		fmt(
			[[
    def mount({}, {}, socket) do
      {{:ok, socket}}{}
    end
    ]],
			{
				i(1, "_params"),
				i(2, "_session"),
				i(0),
			}
		)
	),

	s(
		{ trig = "lvhe ([%w_]+) (.*)", regTrig = true, hidden = true },
		fmt(
			[[
    def handle_event("{}", {}, socket) do
      {{:noreply, socket}}{}
    end
    ]],
			{
				d(1, function(_, snip)
					return sn(1, { t(snip.captures[1]) })
				end),
				d(2, function(_, snip)
					local args = snip.captures[2]
					if args == "" or args == "_" then
						return sn(1, { t("_params") })
					else
						local result = {}
						for txt in string.gmatch(args, "%S+") do
							table.insert(result, '"' .. txt .. '"' .. " => " .. txt)
						end
						return sn(1, t("%{" .. table.concat(result, ", ") .. "}"))
					end
				end),
				i(0),
			}
		)
	),
})
