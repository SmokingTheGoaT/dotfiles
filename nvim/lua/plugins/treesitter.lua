return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require('nvim-treesitter.configs')
		treesitter.setup({
			ensure_installed = {
				"lua",
				"go",
				"markdown",
				"markdown_inline",
				"rust",
				"typescript",
				"javascript",
				"vimdoc",
				"bash",
				"jsdoc",
				"zig",
				"python",
				"html",
				"css",
				"graphql",
				"svelte",
				"c",
				"vim",
				"query",
				"dockerfile",
				"gitignore",
				"tsx",
				"yaml",
				"json",
			},
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true, -- Enable highlighting
			},
			autotag = {
				enable = true,
			},
		})
	end,
}

