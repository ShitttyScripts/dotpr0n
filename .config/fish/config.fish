if not status --is-interactive

    exit 0

else

    # Disable annoying greeting message
    set fish_greeting ""

    set -gx OS (uname)

    # Terminal colors
    set -gx TERM xterm-256color

    # Set language environment
    set -gx LANG en_US.UTF-8
    set -gx LANGUAGE en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8
    set -gx LC_CTYPE en_US.UTF-8

    # Base aliases
    alias l "ls -lah"
    alias vi "nvim"
    alias vim "nvim"

    # Plugins
    set fish_function_path $fish_function_path $HOME/.config/fish/plugins/plugin-foreign-env/functions

    # Homesick
    if test -d $HOME/.homesick
        source $HOME/.homesick/repos/homeshick/homeshick.fish > /dev/null 2>&1
    end

    # Global paths
    set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $HOME/bin $HOME/.local/bin $PATH
    set -gx MANPATH /usr/share/man /usr/local/man /usr/local/share/man $MANPATH

    # OS specific paths
    switch $OS
        case Darwin
            set -gx PATH /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin $HOME/.pear/bin $HOME/Library/Python/3.7/bin $PATH
            set -gx MANPATH /usr/local/man /usr/share/man /usr/local/share/man $MANPATH
            set -g fish_user_paths /usr/local/sbin $fish_user_paths

            # MacPorts
            # set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
            # set -gx PATH /usr/local/nvim-osx64/bin /opt/local/bin /opt/local/sbin $PATH
            # set -gx MANPATH $MANPATH /opt/local/man/

            # Homebrew
            # set -gx PATH $PATH /usr/local/homebrew/bin
            set -gx HOMEBREW_NO_ANALYTICS 1
            set -gx HOMEBREW_NO_AUTO_UPDATE 1
            set -gx HOMEBREW_NO_GITHUB_API 1
            set -gx HOMEBREW_NO_INSECURE_REDIRECT 1
            set -gx DYLD_FALLBACK_LIBRARY_PATH /usr/local/opt/openssl/lib $DYLD_FALLBACK_LIBRARY_PATH
        case FreeBSD
            # null
        case '*'
            # null
    end

    # Set preferred editors and pagers
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx PAGER less
    set -gx MANPAGER 'less -X'

    # Colorize man
    set MANROFFOPT '-c'
    set LESS_TERMCAP_mb (tput bold; tput setaf 2)
    set LESS_TERMCAP_md (tput bold; tput setaf 6)
    set LESS_TERMCAP_me (tput sgr0)
    set LESS_TERMCAP_so (tput bold; tput setaf 3; tput setab 4)
    set LESS_TERMCAP_se (tput rmso; tput sgr0)
    set LESS_TERMCAP_us (tput smul; tput bold; tput setaf 7)
    set LESS_TERMCAP_ue (tput rmul; tput sgr0)
    set LESS_TERMCAP_mr (tput rev)
    set LESS_TERMCAP_mh (tput dim)

    # Composer
    # if test -d $HOME/.composer/vendor/bin
    #     set -gx PATH $PATH $HOME/.composer/vendor/bin
    # end

    # yarn
    if test -d $HOME/.yarn/bin
        set -gx PATH $PATH $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin
    end

    # rvm
    # if test -d /usr/local/rvm/bin
    #     set -x PATH $PATH /usr/local/rvm/bin
    #     rvm default > /dev/null 2>&1
    # end
    #
    # if test -d $HOME/.rvm/bin
    #     set -x PATH $PATH $HOME/.rvm/bin
    #     rvm default > /dev/null 2>&1
    # end

    # pyenv
    if test -d $HOME/.pyenv
        set -x PYENV_ROOT $HOME/.pyenv
        set -x PATH $PYENV_ROOT/bin $PATH
        source (pyenv init -|psub) > /dev/null 2>&1
    end

    # acme.sh
    # if test -d $HOME/.acme.sh
    #     set -gx PATH $PATH $HOME/.acme.sh
    # end

    # Composer
    if test -d $HOME/.composer
        set PATH $PATH $HOME/.composer/vendor/bin
    end

    # Go
    if test -d $HOME/go
        set GOPATH $HOME/go
        set PATH $PATH $GOPATH/bin
    end

    # fzf
    if test -d $HOME/.fzf/shell
        source $HOME/.fzf/shell/key-bindings.fish
        set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    end

    # luaenv
    # if test -d $HOME/.luaenv
    #     set -x PATH $PATH $HOME/.luaenv/bin
    #     source (luaenv init -|psub) > /dev/null 2>&1
    # end

    # swiftenv
    # if test -d $HOME/.swiftenv
    #     set SWIFTENV_ROOT $HOME/.swiftenv
    #     set PATH $SWIFTENV_ROOT/bin $PATH
    #     status --is-interactive; and source (swiftenv init -|psub) > /dev/null 2>&1
    # end

    # Rust
    # if test -d $HOME/.cargo
    #     source $HOME/.cargo/env > /dev/null 2>&1
    # end

    # myrepos
    # if test -d $HOME/.myrepos
    #     set -gx PATH $PATH $HOME/.myrepos
    # end

    # kitty
    if command --search kitty > /dev/null
        kitty + complete setup fish | source
    end

    # Source command abbreviations
    source $HOME/.config/fish/abbreviations.fish > /dev/null 2>&1

    # iTerm integration
    # if test -e {$HOME}/.iterm2_shell_integration.fish
    #     source {$HOME}/.iterm2_shell_integration.fish
    # end

    # Colorscheme (Solarized Dark)

    set fish_color_autosuggestion 555 brblack
    set fish_color_cancel -r
    set fish_color_command 93a1a1
    set fish_color_comment 586e75
    set fish_color_cwd green
    set fish_color_cwd_root red
    set fish_color_end 268bd2
    set fish_color_error dc322f
    set fish_color_escape 00a6b2
    set fish_color_history_current --bold
    set fish_color_host normal
    set fish_color_match red
    set fish_color_normal normal
    set fish_color_operator 00a6b2
    set fish_color_param 839496
    set fish_color_quote yellow
    set fish_color_redirection 6c71c4
    set fish_color_search_match --background=black
    set fish_color_selection --background 666
    set fish_color_status red
    set fish_color_user brgreen
    set fish_color_valid_path --underline
    set fish_pager_color_completion B3A06D
    set fish_pager_color_description 4B646C white
    set fish_pager_color_prefix cyan --underline
    set fish_pager_color_progress brwhite --background=cyan

end
