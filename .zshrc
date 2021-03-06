# compinit
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  autoload -Uz add-zsh-hook
  autoload -Uz history-search-end
  compinit
fi

# $PATH.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# $ENV.
export LANG=C
export EDITOR="vim"
export PAGER="less"
export DF="$HOME/dotfiles"
export WS="$HOME/workspace"
export BOX="$HOME/Dropbox"

# PROMPT.
export PROMPT='
%F{yellow}%1/%f %F{green}●%f%F{yellow}●%f%F{red}●%f (%U%/%u)
→ '

# Zsh completion settings.
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# Zsh histroy settings.
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store

# Emacs-like key bindings.
bindkey -e

# Relaunch current shell.
alias reload="exec $SHELL -l"

# EDITOR alias.
alias vi="$EDITOR"
alias vim="$EDITOR"

# Global aliases.
alias -g G="| grep"
alias -g X="| xargs"

# Add flags.
alias mv="mv -vi"
alias cp="cp -vi"

# Replace rm to gomi.
alias rm="gomi"

# Replace ls to exa.
alias ls="exa --group-directories-first"
alias l="exa -laaF --group-directories-first"
alias lt='exa -TaF --group-directories-first --ignore-glob=".git|node_modules|plugged|vendor"'

# Navigation.
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias box="cd $BOX"
alias df="cd $DF"
alias ws="cd $WS"

chpwd_function() {
	l
}

add-zsh-hook chpwd chpwd_function

# Edit config files.
alias zshrc="$EDITOR $DF/.zshrc"
alias vimrc="$EDITOR $DF/.vimrc"
alias macosrc="$EDITOR $DF/macos.sh"
alias alacrittyrc="$EDITOR $DF/.config/alacritty/alacritty.yml"
alias gokurc="$EDITOR $DF/.config/karabiner.edn"
alias gitrc="$EDITOR $DF/.gitconfig"
alias batrc="$EDITOR $DF/.config/bat/config"
alias tmuxrc="$EDITOR $DF/.tmux.conf"
alias deltarc="$EDITOR $DF/.gitconfig"
alias fdignore="$EDITOR $DF/.fdignore"
alias tigrc="$EDITOR $DF/.tigrc"

# Run scripts.
alias macosrun="sh $DF/macos.sh"

# Homebrew.
mybrew() {
  local dump_commands=('install' 'uninstall')
  local main_command="${1}"

  brew ${@}

  for command in "${dump_commands[@]}"; do
    [[ "${command}" == "${main_command}" ]] && brew bundle dump --file="${HOME}/.Brewfile" --force --describe
  done
}
alias brew="mybrew"
alias bs="mybrew search"
alias bi="mybrew install"
alias bu="mybrew uninstall"
alias bl="mybrew list"
alias bd="mybrew bundle dump --file=~/.Brewfile --force --describe"

# Git.
alias g="git"
alias gs="git status"
alias gsu="git status -u"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gl="git log"
alias gl1="git log --oneline"

# zsh-syntax-highlighting.
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions.
. /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-history-substring-search
. /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# python.
export PYTHONDONTWRITEBYTECODE=1

# fzf.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND='fd --type f --hidden . ~'
export FZF_CD_COMMAND='fd --type d --hidden . ~'

# asdf-vm.
. /usr/local/opt/asdf/asdf.sh
