# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# Set theme BEFORE sourcing oh-my-zsh
ZSH_THEME="amuse"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Custom prompt (set AFTER oh-my-zsh is loaded)
PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)
$ '

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# 1password SSH
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# PERFORMANCE OPTIMIZATION: Cache brew prefix
if [[ -z "$HOMEBREW_PREFIX" ]]; then
  export HOMEBREW_PREFIX="$(brew --prefix)"
fi

# NVM setup - only loads when entering Node.js projects
export NVM_DIR="$HOME/.nvm"

# Aliases
alias gpl="git pull origin master"
alias gph="git push origin HEAD"
alias gpull="git pull origin"
alias gpush="git push origin"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"
alias gdd="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias vim="nvim"
alias nv="neovide --fork --frame transparent"

export GPG_TTY=$(tty)

# FZF setup (optimized file check)
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
  export FZF_DEFAULT_COMMAND='fd --type f .'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Custom functions
ff() {
    local selected_dir="$(fd --type d . "$HOME/Developer" "$HOME/Downloads" | fzf)"
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
    fi
}

ffv() {
    local selected_dir="$(fd --type d . "$HOME/Developer" "$HOME/Downloads" | fzf)"
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
        nvim .
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

# PERFORMANCE OPTIMIZATION: Use cached homebrew prefix
if [[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# PATH exports (consolidated)
export PATH="/opt/homebrew/opt/openjdk/bin:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$HOME/.rvm/bin:/opt/homebrew/opt/libpq/bin:$PATH"

# Java setup
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Bun setup (optimized)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# pnpm setup
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# PERFORMANCE OPTIMIZATION: Auto-load NVM only when package.json is present
autoload -U add-zsh-hook

load-nvmrc() {
  # Only run if there's a package.json in current directory
  if [[ ! -f "package.json" ]]; then
    return
  fi
  
  # Load NVM if not already loaded
  if ! command -v nvm &> /dev/null; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi
  
  local node_version="$(nvm version 2>/dev/null)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      echo "Installing Node.js version from .nvmrc..."
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      echo "Switching to Node.js $(cat "${nvmrc_path}")..."
      nvm use
    fi
  elif [[ -f "package.json" ]]; then
    # If there's a package.json but no .nvmrc, ensure we're using a valid node version
    if [[ "$node_version" == "N/A" || "$node_version" == "none" ]]; then
      echo "No .nvmrc found, using default Node.js version..."
      nvm use default 2>/dev/null || nvm use node 2>/dev/null
    fi
  fi
}

# Set up the hook for directory changes
add-zsh-hook chpwd load-nvmrc

# Run it once for the current directory
load-nvmrc

# Time formatting
if [[ `uname` == Darwin ]]; then
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


alias claude="/Users/arjunkomath/.claude/local/claude"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
