if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.

if [ -d ~/.oh-my-zsh ]; then
	export ZSH="$HOME/.oh-my-zsh"
	export LC_ALL=no_NO.UTF-8

	ZSH_THEME="powerlevel10k/powerlevel10k"
	ENABLE_CORRECTION="false"

	plugins=(
		git 
		github 
		yarn 
		brew 
		npm 
		rbenv
		zsh-syntax-highlighting
    	zsh-autosuggestions
	)

	ZSH_DOTENV_PROMPT=false

	source $ZSH/oh-my-zsh.sh
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=$PATH:$GEM_HOME/bin:$HOME/repos/flutter/bin
export PATH="$HOME/usr/local/bin:$PATH"
export PATH="$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"


if command -v rbenv > /dev/null; then
	export GEM_HOME=$HOME/.gem
	eval "$(rbenv init -)"
fi

if command -v pyenv > /dev/null; then
	export PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
fi

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"