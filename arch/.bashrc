#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias gst='git status'
alias gcmsg='git commit -m'
alias ga='git add'
alias gcl='git clone'
alias gp='git push'

if command -v fastfetch >/dev/null 2>&1; then
fastfetch
fi
