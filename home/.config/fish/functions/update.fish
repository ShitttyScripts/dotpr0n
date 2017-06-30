function __freebsd_update
	# printf "===[ System Software Update ]==============================\n"; and \
	# freebsd-update fetch; and \
	# freebsd-update install
	printf "===[ Update System Sources ]===============================\n"; and \
	svnlite update /usr/src
	printf "\n===[ Update Ports ]========================================\n"; and \
	portsnap fetch update
	# printf "\n===[ Compile and Upgrade Software ]========================"; and \
	# synth upgrade-system
	printf "\n===[ Upgrade Software ] ===================================\n"; and \
	pkg update; and \
	pkg upgrade
	printf "\n===[ npm ]=================================================\n"; and \
	npm upgrade -g
	printf "===[ Gems ]================================================\n"; and \
	gem update; and \
	gem cleanup
	# printf "\n===[ pip ]================================================="; and \
	# python -m pip_review --auto
	# python3 -m pip_review --auto
end

function __macos_update
	printf "\n===[ Apple Software Update ]===============================\n"; and \
	sudo softwareupdate -i -a
	printf "\n===[ App Store ]===========================================\n"; and \
	mas upgrade
	# printf "\n===[ MacPorts ]============================================\n"; and \
	# sudo port selfupdate; and \
	# sudo port outdated; and \
	# sudo port upgrade outdated; and \
	# sudo port uninstall leaves
	# port uninstall inactive
	printf "\n===[ Homebrew ]============================================\n"; and \
	brew update; and \
	brew upgrade --cleanup; and \
	brew install --HEAD universal-ctags; and \
	brew install --HEAD https://raw.githubusercontent.com/mawww/kakoune/master/contrib/kakoune.rb; and \
	brew cleanup -s; and \
	brew prune
	printf "\n===[ npm ]=================================================\n"; and \
	npm upgrade -g
	printf "\n===[ Gems ]================================================\n"; and \
	gem update; and \
	gem cleanup
	printf "\n===[ pip ]=================================================\n"; and \
	python -m pip_review --auto
	python3 -m pip_review --auto
end

function __linux_update
	printf "\n===[ apt-get ]=============================================\n"; and \
	sudo apt-get update; and \
	sudo apt-get -y upgrade; and \
	sudo apt-get -y dist-upgrade; and \
	sudo apt-get -y autoremove; and \
	sudo apt-get -y remove (deborphan)
	printf "\n===[ npm ]=================================================\n"; and \
	npm upgrade -g
	# printf "===[ Gems ]================================================"; and \
	# sudo gem update
	# printf "===[ pip ]================================================="
	# if (cat /etc/issue) -eq "Ubuntu"
		# printf "pip updates not supported on Ubuntu as some packages are owned by the system."
	# else
		# sudo python -m pip install --upgrade (python -m pip list --outdated | awk '/.*/ {print $1}'); and \
		# sudo python3 -m pip install --upgrade (python3 -m pip list --outdated | awk '/.*/ {print $1}')
	# end
end

function update
	switch (uname)
		case Darwin
			__macos_update
		case Linux
			__linux_update
		case FreeBSD
			__freebsd_update
		case '*'
			printf "No update function for %s yet." (uname)
	end
end
