#!/usr/bin/env bash

# Setup and config bash / zsh files
DOTFILES_DIR=${PWD/#$HOME/'~'}
ZSHRC="${DOTFILES_DIR}/.zshrc"
BASH_ALIASES="${DOTFILES_DIR}/.aliases"

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

echo "source ${ZSHRC}" > ~/.zshrc
echo "source ${BASH_ALIASES}" >> ~/.zshrc
echo "alias aliases='code ${DOTFILES_DIR}/.aliases'" >> ~/.zshrc
echo "alias zshrc='code ${DOTFILES_DIR}/.zshrc'" >> ~/.zshrc
echo "source ${DOTFILES_DIR}/.p10k.zsh" >> ~/.zshrc

# Git config
git config pull.rebase true --global

# Setup macOS utilities and config (if applicable)
if [[ $OSTYPE == 'darwin'* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  chmod +x loginscriptbackspace.sh
  source ./macosdefaults.sh
  if [[ ! -f "`which brew`"  ]] ; then
      echo "Installing Hombrew"
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      # Install fonts
      brew tap homebrew/cask-fonts
      brew install font-cascadia-code --cask 
      brew install font-caskaydia-cove-nerd-font --cask 
  else
      echo "Updating Homebrew"
      brew update
      brew upgrade
  fi
  if command -v pyenv > /dev/null; then
      brew install pyenv
  fi
fi
