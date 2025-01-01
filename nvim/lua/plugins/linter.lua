return {
	"mfussenegger/nvim-lint",
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = {'markdownlint'},
			json = {'jsonlint'},
			bash = {'bash'},
			text = {'vale'},
			dockerfile = {'hadolint'},
			go = {'golangcilint'},
			rust = {'clippy'},
			javascript = {'eslint'},
			typescript = {'eslint'},
		}
		local lint_group = vim.api.nvim_create_augroup('lint', { clear = true })
		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = lint_group,
			callback = function()
				if vim.opt_local.modifiable:get() then
					lint.try_lint()
				end
			end,
		})
	end,
}
