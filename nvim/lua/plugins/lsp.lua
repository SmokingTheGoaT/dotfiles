return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"SmiteshP/nvim-navic",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local navic = require("nvim-navic")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tailwindcss",
				"gopls",
				"ts_ls",
				"markdown_oxide",
				"zls",
				"jsonls",
				"pyright",
				"ast_grep",
				"dockerls",
				"bashls",
				"clangd",
				"yamlls",
				"vimls",
				"taplo",
				"sqls",
			},
			handlers = {
				function(server_name)
					local opts = {
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							local bufopts = { noremap = true, silent = true, buffer = bufnr }
							vim.keymap.set(
								"n",
								"gd",
								vim.lsp.buf.definition,
								vim.tbl_extend("force", bufopts, { desc = "Toggle definition" })
							)
							vim.keymap.set(
								"n",
								"gD",
								vim.lsp.buf.declaration,
								vim.tbl_extend("force", bufopts, { desc = "Go to declaration" })
							)
							vim.keymap.set(
								"n",
								"gi",
								vim.lsp.buf.implementation,
								vim.tbl_extend("force", bufopts, { desc = "Go to implementation" })
							)
							vim.keymap.set(
								"n",
								"gr",
								vim.lsp.buf.references,
								vim.tbl_extend("force", bufopts, { desc = "Go to references" })
							)
							vim.keymap.set(
								"n",
								"K",
								vim.lsp.buf.hover,
								vim.tbl_extend("force", bufopts, { desc = "Toggle hover definition" })
							)
							vim.keymap.set(
								"n",
								"<C-k>",
								vim.lsp.buf.signature_help,
								vim.tbl_extend("force", bufopts, { desc = "Get signature help" })
							)
							vim.keymap.set(
								"n",
								"<leader>ra",
								vim.lsp.buf.rename,
								vim.tbl_extend("force", bufopts, { desc = "LSP rename" })
							)
							vim.keymap.set(
								"n",
								"<leader>ca",
								vim.lsp.buf.code_action,
								vim.tbl_extend("force", bufopts, { desc = "Toggle code action" })
							)
							vim.keymap.set("n", "<leader>fmt", function()
								vim.lsp.buf.format({ async = true })
							end, bufopts)
							if client.server_capabilities.documentSymbolProvider then
								navic.attach(client, bufnr)
							end
						end,
					}

					-- if server_name == "clangd" then
					-- 	opts.init_options = {
					-- 		fallbackFlags = { "--std=c++20" },
					-- 	}
					-- end

					if server_name == "lua_ls" then
						opts.settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
									path = vim.split(package.path, ";"),
								},
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
									},
									checkThirdParty = false,
								},
								telemetry = {
									enable = false,
								},
							},
						}
					end

					if server_name == "gopls" then
						local util = require("lspconfig/util")
						opts.cmd = { "gopls" }
						opts.filetypes = { "go", "gomod", "gowork", "gotmpl" }
						opts.root_dir = function(fname)
							local dir = util.root_pattern("go.work", "go.mod", ".git")(fname) or vim.fn.getcwd()
							vim.notify("Detected root directory: " .. dir, vim.log.levels.INFO)
							return dir
						end
						opts.settings = {
							gopls = {
								completeUnimported = true,
								usePlaceholders = true,
								analyses = {
									unusedparams = true,
								},
								-- workspace = {
								-- 	experimentalWorkspaceModule = true,
								-- },
							},
						}
					end

					require("lspconfig")[server_name].setup(opts)
				end,

				-- ["clangd"] = function()
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig.clangd.setup({
				-- 		-- init_options = {
				-- 		-- 	fallbackFlags = { "--std=c++20" },
				-- 		-- },
				-- 	})
				-- end,
				--
				-- ["lua_ls"] = function()
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig.lua_ls.setup({
				-- 		capabilities = capabilities,
				-- 		settings = {
				-- 			Lua = {
				-- 				runtime = {
				-- 					version = "LuaJIT",
				-- 					path = vim.split(package.path, ";"),
				-- 				},
				-- 				diagnostics = {
				-- 					globals = { "vim", "it", "describe", "before_each", "after_each" },
				-- 				},
				-- 				workspace = {
				-- 					library = {
				-- 						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				-- 						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				-- 					},
				-- 					checkThirdParty = false,
				-- 				},
				-- 				telemetry = {
				-- 					enable = false,
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
				--
				-- ["gopls"] = function()
				-- 	local lspconfig = require("lspconfig")
				-- 	local util = require("lspconfig/util")
				-- 	lspconfig.gopls.setup({
				-- 		capabilities = capabilities,
				-- 		cmd = { "gopls" },
				-- 		filetypes = { "go", "gomod", "gowork", "gotmpl" },
				-- 		root_dir = function(fname)
				-- 			local dir = util.root_pattern("go.work", "go.mod", ".git")(fname) or vim.fn.getcwd()
				-- 			vim.notify("Detected root directory: " .. dir, vim.log.levels.INFO)
				-- 			return dir
				-- 		end,
				-- 		settings = {
				-- 			completeUnimported = true,
				-- 			usePlaceholders = true,
				-- 			analyses = {
				-- 				unusedparams = true,
				-- 			},
				-- 			workspace = {
				-- 				experimentalWorkspaceModule = true,
				-- 			},
				-- 		},
				-- 	})
				-- end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "if_many",
				header = "",
				prefix = "",
			},
		})

		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"clang-format",
				"shfmt",
				"golines",
				"goimports",
				"gofumpt",
				"gci",
			},
		})
	end,
}
