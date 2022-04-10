DOTFILES_DIR=${PWD/#$HOME/'~'}
ZSHRC="${DOTFILES_DIR}/.zshrc"
BASH_ALIASES="${DOTFILES_DIR}/.bash_aliases"
echo "source ${ZSHRC}" > ~/.zshrc
echo "source ${BASH_ALIASES}" >> ~/.zshrc
echo "alias aliases='code ${DOTFILES_DIR}/.bash_aliases'" >> ~/.zshrc
echo "alias zshrc='code ${DOTFILES_DIR}/.zshrc'" >> ~/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc