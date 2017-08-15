if status --is-interactive

	set -gx OS (uname)

    # Base aliases
    alias ll "ls -lah"

	# Plugins
	set fish_function_path $HOME/.config/fish/functions/pure $fish_function_path
	set fish_function_path $HOME/.config/fish/functions/bass $fish_function_path

	# Homesick
	if test -d $HOME/.homesick
		source "$HOME/.homesick/repos/homeshick/homeshick.fish"
	end

	# Global paths
	set -gx PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $HOME/bin $PATH
	set -gx MANPATH /usr/share/man $MANPATH

	# Terminal colors
	set -gx TERM xterm-256color

	# OS specific paths
	switch $OS
		case Darwin
			set -gx PATH $HOME/homebrew/bin $HOME/homebrew/sbin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin $HOME/.pear/bin $PATH
			set -gx MANPATH $HOME/homebrew/share/man /usr/local/man /usr/share/man /usr/local/share/man $MANPATH
		case FreeBSD
			# null
		case '*'
			# null
	end

	# Set language environment
	set -gx LANG en_US.UTF-8
	set -gx LANGUAGE en_US.UTF-8
	set -gx LC_ALL en_US.UTF-8
	set -gx LC_CTYPE en_US.UTF-8

	# Homebrew
	set -gx HOMEBREW_BUILD_FROM_SOURCE 1

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
	# set -gx NVIM_TUI_ENABLE_CURSOR_SHAPE 1

	# rvm
	if test -d /usr/local/rvm/bin
		set -gx PATH $PATH /usr/local/rvm/bin
		rvm default
	end

	if test -d $HOME/.rvm/bin
		set -gx PATH $PATH $HOME/.rvm/bin
		rvm default
	end

	# pyenv
	#if test -d $HOME/.pyenv
	#	set -gx PYENV_ROOT $HOME/.pyenv
	#	set -gx PATH $PYENV_ROOT/bin $PATH
	#	source (pyenv init -|psub)
	#end

	# swiftenv
	if test -d $HOME/.swiftenv
		set SWIFTENV_ROOT $HOME/.swiftenv
		set PATH $SWIFTENV_ROOT/bin $PATH
		status --is-interactive; and source (swiftenv init -|psub)
	end

	# Go
	if test -d $HOME/go
        set GOPATH $HOME/go
        set PATH $PATH $GOPATH/bin
    end

	# Rust
	if test -d $HOME/.cargo
        source $HOME/.cargo/env
    end

	# Source command abbreviations
	source $HOME/.config/fish/abbreviations.fish

end
