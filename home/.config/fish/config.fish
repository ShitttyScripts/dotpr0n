if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'edc/bass'
fundle plugin 'fisherman/z'
fundle plugin 'rafaelrinaldi/pure'

fundle init

# Homesick
source "$HOME/.homesick/repos/homeshick/homeshick.fish"

# Global paths
set -gx PATH /usr/bin /bin /usr/sbin /sbin $HOME/bin $PATH
set -gx FPATH $HOME/.zfunctions $HOME/.zsh/zsh-completions/src $FPATH
set -gx MANPATH /usr/share/man $MANPATH

set -gx PATH /opt/local/bin /opt/homebrew/bin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin /usr/local/bin $home/.pear/bin $PATH
set -gx PATH $PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin /opt/local/Library/Frameworks/Python.framework/Versions/3.5/bin
set -gx FPATH /opt/homebrew/share/zsh-completions /opt/homebrew/share/zsh/site-functions $FPATH
set -gx MANPATH /opt/homebrew/share/man /usr/local/man /usr/share/man /usr/local/share/man $MANPATH

# Set language environment
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Composer
set -gx PATH $PATH $HOME/.composer/vendor/bin

# yarn
# set -gx PATH $PATH $HOME/.yarn/bin

# Set preferred editors and pagers
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx MANPAGER less -X

# Neovim
set -gx NVIM_TUI_ENABLE_CURSOR_SHAPE 1

# rvm
rvm default
