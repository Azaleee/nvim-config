Tuto link : https://dev.to/slydragonn/ultimate-neovim-setup-guide-lazynvim-plugin-manager-23b7

# Créer un dossier pour stocker les binaires locaux
mkdir -p ~/neovim

# Aller dans le dossier
cd ~/neovim

# Télécharger la dernière version de Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz

# Extraire l'archive
tar xzf nvim-linux64.tar.gz

# Ajouter NeoVim au PATH temporairement
export PATH=$HOME/neovim/nvim-linux64/bin:$PATH
Avec cette méthode, NeoVim sera installé dans ton dossier personnel. Pour qu'il soit disponible en permanence dans le terminal, ajoute cette ligne à ton fichier ~/.bashrc ou ~/.zshrc :

bash
Copy code
export PATH=$HOME/neovim/nvim-linux64/bin:$PATH
