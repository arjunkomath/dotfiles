# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
ZSH_THEME="amuse"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Prompt
PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)
$ '

# Editor & Environment
export EDITOR='nvim'
[[ -n $SSH_CONNECTION ]] && export EDITOR='vim'
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew"

# Environment Variables
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/Library/pnpm"

# PATH
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.amp/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/libpq/bin:$PATH"

# Aliases
alias gpl="git pull origin master"
alias gph="git push origin master"
alias gpull="git pull origin"
alias gpush="git push origin"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias gdd="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias vim="nvim"
alias nv="neovide --fork --frame transparent"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Functions
ff() {
    local selected_dir="$(fd --type d . "$HOME/Developer" "$HOME/Downloads" | fzf)"
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
    fi
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# FZF
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f .'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# mise
eval "$(mise activate zsh)"

# Bun Completions
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# Time Formatting
if [[ "$OSTYPE" == darwin* ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# Local Config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
