local M = {}

M.setup = function()
	-- Set global leader to <Space>
	vim.g.mapleader = " "
	-- Set local global to \\
	vim.g.maplocalleader = "\\"

	local opts = { noremap = true, silent = true }

	-- Useful shorcuts

	-- Exit insert mode 
	vim.keymap.set("i", "jk", "<Esc>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))

	-- Save current buffer 
	vim.keymap.set("n", "<leader>w", ":w<CR>", vim.tbl_extend("force", opts, { desc = "Save current buffer" }))

	-- Quit current buffer
	vim.keymap.set("n", "<leader>q", ":q<CR>", vim.tbl_extend("force", opts, { desc = "Quit current buffer" }))

	-- Save and quite current buffer
	vim.keymap.set("n", "<leader>wq", ":wq<CR>", vim.tbl_extend("force", opts, { desc = "Save & quit current buffer" }))

	-- Force quit current buffer
	vim.keymap.set("n", "<leader>qq", ":q!<CR>", vim.tbl_extend("force", opts, { desc = "Force quit current buffer" }))

	-- Prompt file name and open a new buffer 
	local function prompt_and_open_file(cmd)
		if cmd == "" then
			print("Missing command to open a new buffer.")
			return
		end
		local file = vim.fn.input("Enter file name: ", "", "file")
		vim.cmd(file == "" and cmd or cmd .. " " .. file)
	end

	-- Prompt resize input for user or use default of 2 
	local function resize_split(direction)
		local arg = vim.fn.input("Enter size: ")
		  -- Validate the input
  		if arg == "" or not tonumber(arg) then
    			print("Invalid size!")
    			return
  		end
		local size = tonumber(arg) or 2
		if direction == "v" then
    			vim.cmd("vertical resize " .. size)
  		elseif direction == "h" then
    			vim.cmd("resize " .. size)
  		else
    			print("Invalid direction! Use 'v' or 'h'.")
  		end
	end

	-- Prompt to open a new buffer with name
	vim.keymap.set("n", "<leader>e", function() prompt_and_open_file("e") end, vim.tbl_extend("force", opts, { desc = "Prompt to open a new buffer with :name" }))

	-- Prompt to open a horizontal split buffer with name
	vim.keymap.set("n", "<leader>sp", function() prompt_and_open_file("split") end, vim.tbl_extend("force", opts, { desc = "Prompt to open a new horizontal buffer with :name" }))

	-- Prompt to open a vertical split buffer with name 
	vim.keymap.set("n", "<leader>vsp", function() prompt_and_open_file("vsplit") end, vim.tbl_extend("force", opts, { desc = "Prompt to open a new vertical buffer with :name" }))

	-- Close all buffers except current
	vim.keymap.set("n", "<leader>ob", ":only<CR>", vim.tbl_extend("force", opts, { desc = "Close all buffers except current" }))

	-- Resize horizontal buffer by x amount
	vim.keymap.set("n", "<leader>rh", function() resize_split("h") end, vim.tbl_extend("force", opts, { desc = "Resize horizontal buffer by x amount" }))

	-- Resize vertical buffer by x amount 
	vim.keymap.set("n", "<leader>rv", function() resize_split("v") end, vim.tbl_extend("force", opts, { desc = "Resize vertical buffer by x amount" }))

	-- Navigate to the next buffer
	vim.keymap.set("n", "<leader>bn", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Navigate to the next buffer" }))

	-- Navigate to the previous buffer
	vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Navigate to the previous buffer" }))

	-- Open buffer by name
	vim.keymap.set("n", "<leader>b", function() prompt_and_open_file("b") end, vim.tbl_extend("force", opts, { desc = "Open buffer by name" }))

	-- Close current buffer
	vim.keymap.set("n", "<leader>bd", ":bd<CR>", vim.tbl_extend("force", opts, { desc = "Close current buffer" }))

	-- Copy selected lines to system clipboard
	vim.keymap.set("v", "<leader>c", '"+y', vim.tbl_extend("force", opts, { desc = "Copy selected lines to system clipboard" }))

	-- Copy a single line to system clipboard
	vim.keymap.set("n", "<leader>cl", ':normal! "+yy<CR>', vim.tbl_extend("force", opts, { desc = "Copy a single line to system clipboard" }))

	-- Copy a file to the system clipboard 
	vim.keymap.set("n", "<leader>cf", ":%y+<CR>", vim.tbl_extend("force", opts, { desc = "Copy a file to system clipboard" }))

	-- Open a new tab, prompt to add file 
	vim.keymap.set("n", "<leader>tb", function() prompt_and_open_file("tabnew") end, vim.tbl_extend("force", opts, { desc = "Prompt to open a new empty tab or with file" }))

	-- Close current tab or tab at position n
	vim.keymap.set("n", "<leader>tbc", function()
		local arg = vim.fn.input("Tab position: ")
	  	-- Validate the input
		if arg == "" then
			vim.cmd("tabclose")
			return
		end
  		if tonumber(arg) then
			vim.cmd("tabclose" .. tonumber(arg))
    			return
  		end
	end, vim.tbl_extend("force", opts, { desc = "Close current tab or tab at position n" }))

	-- Terminal 
	vim.keymap.set("n", "<leader>th", ":split | wincmd J | terminal<CR>i", opts)
	vim.keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>i", opts)
	vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts) -- Move left
	vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts) -- Move right
	vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts) -- Move down
	vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts) -- Move up

	-- Oil.nvim 
	vim.keymap.set("n", "<leader>n", ":Oil<CR>", opts)
	vim.keymap.set("n", "<leader>nv", ":vsplit | Oil<CR>", opts)
	vim.keymap.set("n", "<leader>nh", ":split | Oil<CR>", opts)

	-- Telescope 
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Telescope git commits' })
	vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope search word under cursor' })
end

return M
