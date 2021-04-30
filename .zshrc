# compinit
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  autoload -Uz add-zsh-hook
  compinit
fi

# $PATH.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# $ENV.
export BOX="$HOME/GoogleDrive"
export DF="$BOX/dotfiles"

# PROMPT.
PROMPT='%~ %# '

# Relaunch current shell.
alias reload="exec $SHELL -l"

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
alias lt="exa -TaF --group-directories-first"

# Navigation.
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias box="cd $BOX"
alias df="cd $DF"

chpwd_function() {
	l
}

add-zsh-hook chpwd chpwd_function

# Edit config files.
alias zshrc="vim $DF/.zshrc"
alias vimrc="vim $DF/.vimrc"
alias macosrc="vim $DF/macos.sh"
alias alacrittyrc="vim $DF/.config/alacritty/alacritty.yml"
alias gokurc="vim $DF/.config/karabiner.edn"
alias gitrc="vim $DF/.gitconfig"

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

# GitHub-cli.

# zsh-syntax-highlighting.
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions.
. /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-history-substring-search
. /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# asdf-vm.
. /usr/local/opt/asdf/asdf.sh
