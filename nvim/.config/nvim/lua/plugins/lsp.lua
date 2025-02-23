return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')
			local lspconfig_defaults = lspconfig.util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lspconfig_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = {buffer = event.buf}

					vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				end,
			})
		end
	},
	{'hrsh7th/cmp-nvim-lsp'},
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{name = 'nvim_lsp'},
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({}),
			})
		end,
	},
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = {'lua_ls', 'gopls'},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,

					lua_ls = function()
						require('lspconfig').lua_ls.setup {
							settings = {
								Lua = {
									diagnostics = {
										globals = {'vim'}
									}
								}
							}
						}
					end,
				},
			})
		end,
	},
}
