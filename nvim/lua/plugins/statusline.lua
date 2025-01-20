return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" },
	config = function()
		local line = require("lualine")
		local trbl = require("trouble")
		local trbl_sb = trbl.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			h1_group = "lualine_c_normal",
		})
		line.setup({
			options = {
				icons_enable = true,
				theme = "papercolor_light",
				component_seperators = "|",
				section_seperators = "",
				disabled_filetypes = { "NvimTree", "oil" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", { trbl_sb.get, cond = trbl_sb.has } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
