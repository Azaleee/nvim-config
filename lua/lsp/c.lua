local lspconfig = require("lspconfig")

-- Configuration pour le serveur clangd (LSP C/C++)
lspconfig.clangd.setup({
	cmd = { "clangd" },  -- Remplacez par le chemin complet si nécessaire
    	filetypes = { "c", "cpp", "objc", "objcpp" },
    	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = function(client, bufnr)
        -- Désactive le formatage automatique de clangd
        	client.resolved_capabilities.document_formatting = false
    	end,
    	settings = {
        	clangd = {
        		fallbackFlags = { "-std=c++17" },  -- Exemple de drapeau pour le standard C++
        	},
    	},
})
