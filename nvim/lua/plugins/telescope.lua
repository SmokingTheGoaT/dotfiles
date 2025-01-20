return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		-- require('telescope.builtin').diagnostics()
		telescope.setup({
			defaults = {
				path_display = { "smart" },
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
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
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
		telescope.load_extension("fzf") -- Example extension

		-- Keymaps
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "Telescope git commits" })
		vim.keymap.set({ "n", "v" }, "<leader>fa", vim.lsp.buf.code_action, { desc = "Display code actions" })
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Telescope search word under cursor" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
