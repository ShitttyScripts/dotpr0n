if status --is-interactive

	set -gx OS (uname)

	# Plugins
	set fish_function_path $HOME/.config/fish/functions/pure $fish_function_path
	set fish_function_path $HOME/.config/fish/functions/bass $fish_function_path

	# Homesick
	if test -d $HOME/.homesick
		source "$HOME/.homesick/repos/homeshick/homeshick.fish"
	end

	# Global paths
	set -gx PATH /usr/bin /bin /usr/sbin /sbin /usr/local/bin $HOME/bin $PATH
	set -gx MANPATH /usr/share/man $MANPATH

	# OS specific paths
	switch $OS
		case Darwin
			set -gx TERM xterm-256color-italic
			set -gx PATH /opt/local/bin /opt/homebrew/bin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin $HOME/.pear/bin $PATH
			set -gx PATH $PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin /opt/local/Library/Frameworks/Python.framework/Versions/3.5/bin
			set -gx MANPATH /opt/homebrew/share/man /usr/local/man /usr/share/man /usr/local/share/man $MANPATH
		case FreeBSD
			set -gx TERM xterm-256color
			set -gx PATH /usr/local/libexec/ccache/world $PATH
			set -gx CCACHE_PATH /usr/bin /usr/local/bin
		case '*'
			set -gx TERM xterm-256color
	end

	# Set language environment
	set -gx LANG en_US.UTF-8
	set -gx LANGUAGE en_US.UTF-8
	set -gx LC_ALL en_US.UTF-8
	set -gx LC_CTYPE en_US.UTF-8

	# Composer
	if test -d $HOME/.composer/vendor/bin
		set -gx PATH $PATH $HOME/.composer/vendor/bin
	end

	# yarn
	if test -d $HOME/.yarn/bin
		set -gx PATH $PATH $HOME/.yarn/bin
	end

	# Set preferred editors and pagers
	set -gx EDITOR nvim
	set -gx VISUAL nvim
	set -gx PAGER less
	set -gx MANPAGER 'less -X'

	# Neovim
	set -gx NVIM_TUI_ENABLE_CURSOR_SHAPE 1

	# rvm
	if functions -q rvm
		rvm default
	end

	if test -d $HOME/.pyenv
		set -gx PYENV_ROOT $HOME/.pyenv
		set -gx PATH $PYENV_ROOT/bin $PATH
		source (pyenv init -|psub)
	end

	# Source command abbreviations
	source $HOME/.config/fish/abbreviations.fish

end
