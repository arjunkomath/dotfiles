# Shell
set -g fish_greeting
set -gx TERM xterm-256color

# Editor & Environment
set -gx EDITOR nvim
test -n "$SSH_CONNECTION" && set -gx EDITOR vim
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Environment Variables
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
set -gx BUN_INSTALL $HOME/.bun
set -gx PNPM_HOME $HOME/Library/pnpm

# PATH
fish_add_path $HOMEBREW_PREFIX/bin
fish_add_path $JAVA_HOME/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path $PNPM_HOME
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.amp/bin
fish_add_path $HOMEBREW_PREFIX/opt/libpq/bin

# Aliases
alias gpl "git pull origin (git branch --show-current)"
alias gph "git push origin (git branch --show-current)"
alias gpull "git pull origin"
alias gpush "git push origin"
alias gs "git status"
alias gd "git diff"
alias gco "git checkout"
alias gdd "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias vim nvim
alias nv "neovide --fork --frame transparent"
alias tailscale "/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Functions
function ff
    set selected_dir (fd --type d . "$HOME/Developer" "$HOME/Downloads" | fzf)
    if test -n "$selected_dir"
        cd $selected_dir
    end
end

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set cwd (cat -- "$tmp")
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- $cwd
    end
    rm -f -- "$tmp"
end

# mise
mise activate fish | source

# Starship
starship init fish | source

# FZF
fzf --fish | source
set -gx FZF_DEFAULT_COMMAND 'fd --type f .'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Local Config
if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
