# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Configure OpenSSL for Python builds
export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"

export PATH="$PATH:/Users/muzz/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PS1="muzz@:%~ % "

# Aliases
alias zs='source ~/.zshrc'
alias ..='cd ..'
alias ...='cd ../..'
alias cpu='top -o cpu'
alias desk='cd ~/Desktop'
alias dev='cd ~/dev'
alias home='cd ~'
alias mem='top -o rsize'
alias myip='curl ipinfo.io/ip'
alias ports='lsof -i -P | grep LISTEN'
alias speed='speedtest'
alias weather='curl wttr.in'
alias h='cat ~/.zsh_history'
alias y='yazi'
alias e='exit'
alias c='clear'


source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

gp() {
  git add .
  git commit -m "$1"
  git push
}

# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

fpath+=~/.zfunc
autoload -Uz compinit && compinit