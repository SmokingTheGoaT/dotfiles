local M = {}

M.setup = function()
	-- Disable Vi compatibility mode
	vim.cmd("set nocompatible")

	-- Enable filetype detection, plugins, and indenting
	vim.cmd("filetype on")
	vim.cmd("filetype plugin on")
	vim.cmd("filetype indent on")

	-- Enable syntax highlighting
	vim.cmd("syntax on")

	-- General settings
	vim.opt.number = true -- Show line numbers
	vim.opt.relativenumber = true
	vim.opt.autoread = true -- Auto-reload files changed outside Neovim
	vim.opt.autoindent = true -- Enable automatic indentation
	vim.opt.cursorline = true -- Highlight the current line
	vim.opt.cursorcolumn = true -- Highlight the current column
	vim.opt.wrap = false -- Do not wrap text
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.autoindent = true
	vim.opt.smartindent = true
	vim.opt.guicursor = "n-v-c:block,i:block"
	vim.opt.splitright = true
	vim.opt.splitbelow = true

	-- Log Levels
	--[[ vim.lsp.set_log_level("debug") ]]
end

return M
