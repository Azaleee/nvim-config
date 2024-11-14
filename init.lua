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
	}
})
vim.api.nvim_set_keymap('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

