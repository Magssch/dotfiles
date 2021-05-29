# Navigation
alias profile="code ~/.bash_profile"     # Open bash profile in VSCode
alias here="code -r ."                   # Swith to this directory in current VSCode window
alias lsa="ls -a"

# Git
alias cb="git checkout"
alias nb="git checkout -b"               # New git branch
alias gs="git status"
alias gc="git commit -m"
alias ga="git add -A"                    # Stage all files in working tree
alias gagc="git add -A && git commit -m" # Stage all files in working tree and commit with message
alias gp="git push"
alias gf="git fetch"
alias get="git pull"
alias gl="git log"
alias grl="git reflog"

# Python / Pip / virtualenv
alias pi="pip install"
alias pf="pip freeze > requirements.txt"
alias va="source venv/bin/activate"
alias venv="python -m virtualenv venv"
alias venv3="python3 -m virtualenv venv"

# Firebase / NPM / Misc.
alias fbdeploy="npm run build && firebase deploy --only hosting"
alias fbserve="npm run build && firebase serve"
alias ns="npm start"
alias nr="npm run"
alias ni="npm install"
alias tf="terraform"
alias crats="npx create-react-app . --template typescript --use-npm"
alias cyprun="npx cypress open"
