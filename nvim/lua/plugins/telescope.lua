return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		-- require('telescope.builtin').diagnostics()
		require('telescope').setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_width = 0.6, -- Set preview width for horizontal layout
					},
					vertical = {
						preview_height = 0.5, -- Set preview height for vertical layout
					},
					preview_cutoff = 120, -- Disable preview for small windows
				},
				sorting_strategy = "ascending", -- Show results in ascending order
				prompt_prefix = "🔍 ", -- Custom prompt prefix
				selection_caret = "➤ ", -- Custom selection indicator
				winblend = 10, -- Add transparency to Telescope window
				file_ignore_patterns = { "%.git/", "node_modules" }, -- Ignore specific files/folders
			},
			pickers = {
				find_files = {
					hidden = true, -- Show hidden files by default
				},
				live_grep = {
					additional_args = function()
						return { "--hidden" } -- Include hidden files in `live_grep`
					end,
				},
			},
			extensions = {
				-- Add extensions here if needed
			},
		})

		-- Load extensions if needed
		-- require('telescope').load_extension('fzf') -- Example extension
	end,
}
