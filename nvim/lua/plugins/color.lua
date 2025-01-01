return {
   {	"morhetz/gruvbox"	},
   {	"tomasr/molokai"	},
	{	"rose-pine/neovim",
		name = "rose-pine",
		config = function ()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
			})
		end
	},
}
