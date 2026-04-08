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
		yarn
		npm
		zsh-syntax-highlighting
		zsh-autosuggestions
	)

	ZSH_DOTENV_PROMPT=false

	source $ZSH/oh-my-zsh.sh
fi

# NVM — lazy-loaded on first use
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

_load_nvm() {
  unfunction nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }

# pyenv — lazy-loaded on first use
if command -v pyenv > /dev/null; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/shims:$PATH"
	pyenv() {
		unfunction pyenv
		eval "$(command pyenv init -)"
		pyenv "$@"
	}
fi

# SDKMAN — lazy-loaded on first use
export SDKMAN_DIR="$HOME/.sdkman"

_load_sdkman() {
  unfunction sdk java gradle kotlin groovy mvn
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

sdk()    { _load_sdkman; sdk "$@"; }
java()   { _load_sdkman; java "$@"; }
gradle() { _load_sdkman; gradle "$@"; }
kotlin() { _load_sdkman; kotlin "$@"; }
groovy() { _load_sdkman; groovy "$@"; }
mvn()    { _load_sdkman; mvn "$@"; }

# macOS PATH additions
if [[ $OSTYPE == 'darwin'* ]]; then
	export PATH="$HOME/usr/local/bin:$HOME/.npm-global/bin:$PATH"
	export PATH="$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi

# gcloud — lazy-loaded on first use
gcloud() {
	unfunction gcloud gsutil bq
	[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && . "$HOME/google-cloud-sdk/path.zsh.inc"
	[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && . "$HOME/google-cloud-sdk/completion.zsh.inc"
	gcloud "$@"
}
gsutil() { unfunction gcloud gsutil bq; gcloud; gsutil "$@"; }
bq()     { unfunction gcloud gsutil bq; gcloud; bq "$@"; }

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

FILE=".venv/bin/activate"
if test -f "$FILE"; then
    source $FILE
fi

function renameFiles () {
  SEARCH="$1"
  REPLACE="$2"
  find . -type f -name "*${SEARCH}*" | while read FILENAME ; do
      NEW_FILENAME="$(echo ${FILENAME} | sed -e "s/${SEARCH}/${REPLACE}/g")";
      mv "${FILENAME}" "${NEW_FILENAME}";
  done
}
