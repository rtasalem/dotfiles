# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aliases
alias obsidian="open -a obsidian"
alias notion="open -a notion"
alias browser="open -a vivaldi"
alias canva="open -a canva"

# path to Oh My ZSH installation
export ZSH="$HOME/.oh-my-zsh"

# Oh My zsh theme
ZSH_THEME="Eastwood"

# Oh My Zsh plugins
plugins=(git docker-compose)

source $ZSH/oh-my-zsh.sh

# Load fastfetch output on terminal startup
if command -v fastfetch >/dev/null 2>&1; then
  fastfetch -l windows
fi
