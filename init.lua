-- Ajouter lazy.nvim au runtime path
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

-- Configurer lazy.nvim et spécifier les plugins à installer
require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
    		branch = "v3.x",
    		dependencies = {
      			"nvim-lua/plenary.nvim",
      			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      			"MunifTanjim/nui.nvim",
    		}
	},
	{
        	"kyazdani42/nvim-web-devicons",
        	config = function()
            	-- Aucune configuration spécifique nécessaire pour les icônes de base
        	end
    	},
	{
    		"tiagovla/tokyodark.nvim",
		opts = {
        	-- custom options here
    		},
    		config = function(_, opts)
        		require("tokyodark").setup(opts) -- calling setup is optional
        		vim.cmd [[colorscheme tokyodark]]
    		end,
	},
	{
		'windwp/nvim-autopairs',
    		event = "InsertEnter",
    		config = true
    		-- use opts = {} for passing setup options
    		-- this is equivalent to setup({}) function
	},
	{
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",         -- Source LSP pour nvim-cmp
            "hrsh7th/cmp-buffer",           -- Source pour la complétion depuis le buffer
            "hrsh7th/cmp-path",             -- Source pour les chemins de fichiers
            "saadparwaiz1/cmp_luasnip",     -- Source pour les snippets Lua
            "L3MON4D3/LuaSnip",             -- Plugin pour gérer les snippets Lua
            "neovim/nvim-lspconfig",        -- Module LSP nécessaire pour la configuration des serveurs
        },
        config = function()
            -- Configuration de nvim-cmp
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)  -- Utilise luasnip pour les snippets
                    end,
                },
                mapping = {
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            -- Configuration de nvim-lspconfig
		local lspconfig = require("lspconfig")

-- Configuration pour le serveur clangd (LSP C/C++)
		lspconfig.clangd.setup({
    			cmd = { "clangd" },  -- Remplacez par le chemin complet si nécessaire
    			filetypes = { "c", "cpp", "objc", "objcpp" },
    			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    			capabilities = require("cmp_nvim_lsp").default_capabilities(),
    			settings = {
        			clangd = {
            				fallbackFlags = { "-std=c++17" },  -- Exemple de drapeau pour le standard C++
        			},
    			},
		}) 
        end,
    },

})
vim.api.nvim_set_keymap('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

