function __prompt_segment
    set -l color $argv[1]
    set -e argv[1]

    set_color $color
    echo -n $argv
    set_color normal
    echo -n ' '
end

function __prompt_file_up
    set -l dir $PWD
    while test "$dir" != /
        for file in $argv
            if test -e "$dir/$file"
                return 0
            end
        end
        set dir (dirname "$dir")
    end

    return 1
end

function __prompt_git_branch
    command -sq git; or return 1
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1; or return 1

    set -l branch (command git symbolic-ref --quiet --short HEAD 2>/dev/null)
    if test -z "$branch"
        set branch (command git describe --tags --exact-match HEAD 2>/dev/null)
    end
    if test -z "$branch"
        set branch (command git rev-parse --short HEAD 2>/dev/null)
    end

    test -n "$branch"; and __prompt_segment brmagenta "on  $branch"
end

function __prompt_node
    __prompt_file_up package.json .node-version .nvmrc; or return 1
    command -sq node; or return 1

    set -l tool_version (command node --version 2>/dev/null)
    test -n "$tool_version"; and __prompt_segment green "via  $tool_version"
end

function __prompt_bun
    __prompt_file_up bun.lockb bun.lock; or return 1
    command -sq bun; or return 1

    set -l tool_version (command bun --version 2>/dev/null)
    test -n "$tool_version"; and __prompt_segment red "via  v$tool_version"
end

function __prompt_deno
    __prompt_file_up deno.json deno.jsonc; or return 1
    command -sq deno; or return 1

    set -l tool_version (command deno --version 2>/dev/null | string match -r '^deno .+' | string replace 'deno ' 'v')
    test -n "$tool_version"; and __prompt_segment green "via  $tool_version"
end

function __prompt_python
    __prompt_file_up pyproject.toml requirements.txt setup.py tox.ini .python-version; or return 1
    command -sq python3; or return 1

    set -l tool_version (command python3 --version 2>/dev/null | string replace 'Python ' 'v')
    test -n "$tool_version"; and __prompt_segment yellow "via  $tool_version"
end

function __prompt_ruby
    __prompt_file_up Gemfile .ruby-version; or return 1
    command -sq ruby; or return 1

    set -l tool_version (command ruby --version 2>/dev/null | string replace -r '^ruby ([^ ]+).*$' 'v$1')
    test -n "$tool_version"; and __prompt_segment red "via  $tool_version"
end

function __prompt_rust
    __prompt_file_up Cargo.toml; or return 1
    command -sq rustc; or return 1

    set -l tool_version (command rustc --version 2>/dev/null | string replace -r '^rustc ([^ ]+).*$' 'v$1')
    test -n "$tool_version"; and __prompt_segment red "via 󱘗 $tool_version"
end

function __prompt_go
    __prompt_file_up go.mod go.work; or return 1
    command -sq go; or return 1

    set -l tool_version (command go version 2>/dev/null | string replace -r '^go version go([^ ]+).*$' 'v$1')
    test -n "$tool_version"; and __prompt_segment cyan "via  $tool_version"
end

function __prompt_java
    __prompt_file_up pom.xml build.gradle build.gradle.kts; or return 1
    command -sq java; or return 1

    set -l tool_version (command java -version 2>&1 | string match -r 'version "([^"]+)"' | string replace -r '.*"([^"]+)".*' 'v$1')
    test -n "$tool_version"; and __prompt_segment red "via  $tool_version"
end

function __prompt_lua
    __prompt_file_up stylua.toml .luarc.json init.lua; or return 1
    command -sq lua; or return 1

    set -l tool_version (command lua -v 2>&1 | string replace -r '^Lua ([^ ]+).*$' 'v$1')
    test -n "$tool_version"; and __prompt_segment blue "via  $tool_version"
end

function __prompt_context
    if test -n "$SSH_CONNECTION"
        set -l short_hostname (hostname -s)
        __prompt_segment yellow "$USER@$short_hostname"
    else if fish_is_root_user
        __prompt_segment yellow "$USER"
    end
end

function __prompt_directory
    set -l dir (prompt_pwd)
    if test -w .
        __prompt_segment cyan $dir
    else
        __prompt_segment cyan "$dir 󰌾"
    end
end

function __prompt_jobs
    set -l job_count (count (jobs -p))
    test $job_count -gt 0; and __prompt_segment blue "✦ $job_count"
end

function fish_prompt
    set -l last_status $status

    __prompt_context
    __prompt_directory
    __prompt_git_branch
    __prompt_node
    __prompt_bun
    __prompt_deno
    __prompt_python
    __prompt_ruby
    __prompt_rust
    __prompt_go
    __prompt_java
    __prompt_lua
    __prompt_jobs

    if test $last_status -eq 0
        set_color --bold green
    else
        set_color --bold red
    end
    echo -n '❯ '
    set_color normal
end
