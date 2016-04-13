# Set correct TERM for plain shell and tmux
if test -n "$TMUX"
    set -x TERM screen-256color
else
    set -x TERM xterm-256color
end

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# Dotfile management
source $HOME/.homesick/repos/homeshick/homeshick.fish
source $HOME/.homesick/repos/homeshick/completions/homeshick.fish

# fish colors
set fish_color_autosuggestion 75715e
set fish_color_command green
set fish_color_comment grey
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end 0087d7
set fish_color_error red
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_match cyan
set fish_color_normal white
set fish_color_operator cyan
set fish_color_param white
set fish_color_quote yellow
set fish_color_redirection white
set fish_color_search_match normal \x2d\x2dbackground\x3d75715e
set fish_color_selection black \x2d\x2dbackground\x3dwhite
set fish_color_valid_path \x2d\x2dunderline

# Paths to your tackle
# set tacklebox_path ~/.tackle ~/.tacklebox

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# set tacklebox_modules virtualfish virtualhooks z

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

# set tacklebox_plugins docker extract grc pip python up

# Load Tacklebox configuration
# source ~/.tacklebox/tacklebox.fish

# Aliases and functions
source $HOME/.aliases.fish
source $HOME/.functions.fish

# Paths
# Global paths
set -x PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin $HOME/.bin $PATH

# Platform-dependent PATH handling
switch (uname)
case Darwin
    set -x PATH (brew --prefix coreutils)/libexec/gnubin /usr/local/opt/ruby/bin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin $HOME/.pear/bin $PATH
    set -x MANPATH /usr/local/man (brew --prefix coreutils)/libexec/gnuman $MANPATH
case Linux
    set -x PATH $HOME/.linuxbrew/bin $PATH
    set -x MANPATH $HOME/.linuxbrew/share/man $MANPATH
    set -x INFOPATH $HOME/.linuxbrew/share/info $INFOPATH
case '*'
    # Do nothing
end

# Homebrew Options
# Homebrew options
switch (uname)
case Darwin
    set -x HOMEBREW_BUILD_FROM_SOURCE 1
    set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
case Linux
    set -x HOMEBREW_BUILD_FROM_SOURCE 1
case '*'
    # Do nothing
end

# Set Neovim TrueColor mode
# switch (uname)
# case Darwin
#   set -x NVIM_TUI_ENABLE_TRUE_COLOR 1
# end

# Set language environment
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Set preferred editors
# Set preferred editors and pagers
set -x EDITOR nvim
set -x VISUAL nvim
set -x PAGER less
set -x MANPAGER 'less -X'

# iTerm 2 Shell integration
# iTerm 2 shell integration
source $HOME/.iterm2_shell_integration.fish

# Ruby version manager
if bass echo > /dev/null
    bass source $HOME/.rvm/scripts/rvm
end

# Use `ag` for fzf searches
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# Set `ls` colors
set -x LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

# less coloring
set -x LESS_TERMCAP_mb (printf "\033[01;31m")
set -x LESS_TERMCAP_md (printf "\033[01;31m")
set -x LESS_TERMCAP_me (printf "\033[0m")
set -x LESS_TERMCAP_se (printf "\033[0m")
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[01;32m")

# Remove deprecated dot for source command
functions -e .

# Set correct terminal colors
eval sh $HOME/.bin/base16-shell/base16-monokai.dark.sh
