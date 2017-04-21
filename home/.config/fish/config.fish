if status --is-interactive

	set -gx OS (uname)

	# Fundle (Begin)
	if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

	fundle plugin 'edc/bass'
	fundle plugin 'rafaelrinaldi/pure'

	fundle init
	# Fundle (End)

	# Homesick
	if test -d $HOME/.homesick
		source "$HOME/.homesick/repos/homeshick/homeshick.fish"
	end

	# Global paths
	set -gx PATH /usr/bin /bin /usr/sbin /sbin /usr/local/bin $HOME/bin $PATH
	set -gx MANPATH /usr/share/man $MANPATH

	switch $OS
		case Darwin
			set -gx PATH /opt/local/bin /opt/homebrew/bin /opt/X11/bin /opt/X11/bin /usr/local/MacGPG2/bin $HOME/.pear/bin $PATH
			set -gx PATH $PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin /opt/local/Library/Frameworks/Python.framework/Versions/3.5/bin
			set -gx MANPATH /opt/homebrew/share/man /usr/local/man /usr/share/man /usr/local/share/man $MANPATH
		case '*'
			# do nothing
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

	# Source command abbreviations
	source $HOME/.config/fish/abbreviations.fish

end
