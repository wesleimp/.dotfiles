local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

local lspkind = require("lspkind")
require('lspkind').init({
    with_text = true,
})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
	},

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            vim_item.menu = source_mapping[entry.source.name]
            return vim_item
        end
    },

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp")
            .update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

require("lspconfig").tsserver.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

require'lspconfig'.elixirls.setup({
    cmd = { "/home/weslei/elixir-ls/release/language_server.sh" }
})

require("symbols-outline").setup({
	highlight_hovered_item = true,
	show_guides = true,
})

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

