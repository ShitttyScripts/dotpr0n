################################################################################
## .zshrc
################################################################################

if [ "`tty`" != "not a tty" ]; then

    os="$(uname)"

    # Load and initialize the completion system ignoring insecure directories.
    autoload -Uz compinit && compinit -i

    # Zsh options
    setopt AUTO_CD              # Auto changes to a directory without typing cd.
    setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
    setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
    setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
    setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
    setopt CDABLE_VARS          # Change directory to a path stored in a variable.
    setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
    setopt MULTIOS              # Write to multiple descriptors.
    setopt EXTENDED_GLOB        # Use extended globbing syntax.
    setopt INC_APPEND_HISTORY   # Append to history file
    setopt HIST_IGNORE_DUPS     # Do not save duplicate commands
    setopt EXTENDED_HISTORY     # Add timestamp to history
    export HISTSIZE=10000       # Set history size
    export SAVEHIST=10000       # Save history after logout
    export HISTFILE=~/.zhistory # History file

    # Plugins and extensions
    # source $HOME/.zsh/fzf-z/fzf-z.plugin.zsh
    source $HOME/.zsh/caniuse.plugin.zsh/caniuse.plugin.zsh
    # source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

    # Set correct TERM for plain shell and tmux
    if [[ -n "$TMUX" ]]; then
        export TERM='screen-256color'
    else
        export TERM='xterm-256color'
    fi

    # Dotfile management
    source $HOME/.homesick/repos/homeshick/homeshick.sh

    # Global paths
    path=(/usr/bin /bin /usr/sbin /sbin $HOME/bin $path)
    fpath=($HOME/.zfunctions /opt/homebrew/share/zsh-completions $HOME/.zsh/zsh-completions/src $fpath)
    manpath=(/usr/share/man $manpath)

    # Pure
    autoload -U promptinit; promptinit
    PURE_CMD_MAX_EXEC_TIME=10
    prompt pure

    # Platform-dependent PATH handling
    case $(uname) in
        Darwin)
            path=(/opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/php70 $HOME/pear/bin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin /usr/local/bin $home/.pear/bin $path)
            manpath=(/opt/homebrew/share/man /usr/local/man /usr/share/man /usr/local/share/man $manpath)
            ;;
        Linux)
            #
            ;;
        *)
          #
    esac

    # Rust
    source $HOME/.cargo/env

    # Set language environment
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LC_CTYPE=en_US.UTF-8

    # Browser
    case $OSTYPE in
    darwin*)
        export BROWSER='open'
        ;;
    esac

    # Set preferred editors and pagers
    export EDITOR=nvim
    export VISUAL=nvim
    export PAGER=less
    export MANPAGER='less -X'

    export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    # Base16 Shell
    #BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-monokai.dark.sh"
    #[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

    # Marker
    [[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

    # Set terminal colors
    case $os in
        Darwin)
            # eval $(gdircolors)
            ;;
        Linux)
            # eval $(dircolors)
            ;;
        *)
          # export LSCOLORS='exfxcxdxbxGxDxabagacad'
    esac

    # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

    # iTerm Shell Integration
    # test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    # fzf
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    export FZF_DEFAULT_COMMAND='ag -g ""'

    # z
    # [ -f /opt/local/etc/profile.d/z.sh ] && source /opt/local/etc/profile.d/z.sh

    # Use colors for less, man, etc.
    # [ -f ~/.LESS_TERMCAP ] && source ~/.LESS_TERMCAP

    # Source aliases and functions
    source $HOME/.aliases
    source $HOME/.functions

    # Autocompletion
    setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
    setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
    setopt PATH_DIRS           # Perform path search even on command names with slashes.
    setopt AUTO_MENU           # Show completion menu on a successive tab press.
    setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
    setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
    unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
    unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

    # Use caching to make completion for commands such as dpkg and apt usable.
    zstyle ':completion::complete:*' use-cache on
    zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

    # Case-insensitive (all), partial-word, and then substring completion.
    if zstyle -t ':prezto:module:completion:*' case-sensitive; then
      zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      setopt CASE_GLOB
    else
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      unsetopt CASE_GLOB
    fi

    # Group matches and describe.
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
    zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
    zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
    zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
    zstyle ':completion:*:default' list-prompt '%S%M matches%s'
    zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' verbose yes

    # Fuzzy match mistyped completions.
    zstyle ':completion:*' completer _complete _match _approximate
    zstyle ':completion:*:match:*' original only
    zstyle ':completion:*:approximate:*' max-errors 1 numeric

    # Increase the number of errors based on the length of the typed word.
    zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

    # Don't complete unavailable commands.
    zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

    # Array completion element sorting.
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

    # Directories
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
    zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
    zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
    zstyle ':completion:*' squeeze-slashes true

    # History
    zstyle ':completion:*:history-words' stop yes
    zstyle ':completion:*:history-words' remove-all-dups yes
    zstyle ':completion:*:history-words' list false
    zstyle ':completion:*:history-words' menu yes

    # Environmental Variables
    zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

    # Populate hostname completion.
    zstyle -e ':completion:*:hosts' hosts 'reply=(
      ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
      ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
      ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
    )'

    # Don't complete uninteresting users...
    zstyle ':completion:*:*:*:users' ignored-patterns \
      adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
      dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
      hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
      mailman mailnull mldonkey mysql nagios \
      named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
      operator pcap postfix postgres privoxy pulse pvm quagga radvd \
      rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

    # ... unless we really want to.
    zstyle '*' single-ignored show

    # Ignore multiple entries.
    zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
    zstyle ':completion:*:rm:*' file-patterns '*:all-files'

    # Kill
    zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
    zstyle ':completion:*:*:kill:*' menu yes select
    zstyle ':completion:*:*:kill:*' force-list always
    zstyle ':completion:*:*:kill:*' insert-ids single

    # Man
    zstyle ':completion:*:manuals' separate-sections true
    zstyle ':completion:*:manuals.(^1*)' insert-sections true

    # Media Players
    zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
    zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
    zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
    zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

    # SSH/SCP/RSYNC
    zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
    zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
    zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
    zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
    zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

    ## Arrow Keys ###########################################

    # OPTION 1: for most systems
    zmodload zsh/terminfo
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down

    # OPTION 2: for iTerm2 running on Apple MacBook laptops
    zmodload zsh/terminfo
    bindkey "$terminfo[cuu1]" history-substring-search-up
    bindkey "$terminfo[cud1]" history-substring-search-down

    # OPTION 3: for Ubuntu 12.04, Fedora 21, and MacOSX 10.9
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down

    ## EMACS mode ###########################################

    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down

    ## VI mode ##############################################

    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down

fi
