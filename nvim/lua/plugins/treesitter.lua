return {
	"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = { "lua", "go", "markdown", "markdown_inline", "rust", "typescript", "javascript", "vimdoc", "bash", "jsdoc", "zig", "python" },
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true, -- Enable highlighting
			},
		})
	end,
}

