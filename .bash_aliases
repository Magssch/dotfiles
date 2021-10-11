# Navigation
alias profile="code ~/.bash_profile"               # Open .bash profile in VSCode
alias zshrc="code ~/.zshrc"                        # Open .zshrc in VSCode
alias aliases="code ~/bash-aliases/.bash_aliases"  # Open .bash_aliases in VSCode
alias here="code -r ."                             # Swith to this directory in current VSCode window
alias lsa="ls -a"

# Git
alias cb="git checkout"
alias cbn="git checkout -b"                        # New git branch
alias gs="git status"
alias gc="git commit -m"
alias ga="git add" 
alias gaa="git add -A"                             # Stage all files in working tree
alias gagc="git add -A && git commit -m"           # Stage all files in working tree and commit with message
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gf="git fetch"
alias get="git pull"
alias gl="git log"
alias gfl="git reflog"

# Git misc.
alias gcz="git cz"
alias pc="pre-commit"

# Python / Pip / virtualenv
alias pi="pip install"
alias pir="pip install -r requirements.txt"
alias pf="pip freeze > requirements.txt"
alias va="source venv/bin/activate"
alias vd="deactivate"
alias venv="python -m virtualenv venv"
alias venv3="python3 -m virtualenv venv"
alias pl="pyenv local"
alias poes="poetry shell"
alias poer="poetry run"
alias pobu="poetry build"

# Docker
alias dc="docker-compose"
alias dps="docker ps"
alias db="docker build"
alias dup="docker-compose up"
alias dupb="docker-compose up --build"
alias dupd="docker-compose up -d"
alias dstop="docker-compose stop"
alias dreset="docker-compose down --volumes"

# NPM
alias ns="npm start"
alias nr="npm run"
alias nb="npm run build"
alias ni="npm install"

# Firebase / Misc.
alias fbdeploy="npm run build && firebase deploy --only hosting"
alias fbserve="npm run build && firebase serve"
alias tf="terraform"
alias crats="npx create-react-app . --template typescript --use-npm"
alias cyprun="npx cypress open"

bindkey "^[[1;7D" beginning-of-line
bindkey "^[[1;7C" end-of-line
bindkey "^[[1;7B" backward-kill-line