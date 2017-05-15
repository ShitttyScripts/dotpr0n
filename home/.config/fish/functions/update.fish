function __freebsd_update
	printf "===[ System Software Update ]==============================\n"; and \
	freebsd-update fetch; and \
	freebsd-update install
	printf "\n===[ Update Ports ]========================================\n"; and \
	portsnap fetch update
	# printf "\n===[ Compile and Upgrade Software ]========================"; and \
	# synth upgrade-system
	printf "\n===[ Upgrade Software ] ===================================\n"; and \
	pkg update; and \
	pkg upgrade
	printf "\n===[ yarn ]================================================\n"; and \
	yarn global upgrade
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
	printf "\n===[ MacPorts ]============================================\n"; and \
	sudo port selfupdate; and \
	sudo port outdated; and \
	sudo port upgrade outdated; and \
	sudo port uninstall leaves
	# port uninstall inactive
	printf "\n===[ Homebrew ]============================================\n"; and \
	brew update; and \
	brew upgrade; and \
	brew cleanup -s
	printf "\n===[ yarn ]================================================\n"; and \
	yarn global upgrade
	printf "\n===[ Gems ]================================================\n"; and \
	gem update; and \
	gem cleanup
	printf "\n===[ pip ]=================================================\n"; and \
	# pip install --user --upgrade $(pip2 list --outdated --format=legacy | awk '/.*/ {print $1}'); and \
	# pip3 install --user --upgrade $(pip3 list --outdated --format=legacy | awk '/.*/ {print $1}')
	sudo -H python -m pip_review --auto
	sudo -H python3 -m pip_review --auto
end

function __linux_update
	printf "\n===[ apt-get ]=============================================\n"; and \
	sudo apt-get update; and \
	sudo apt-get -y upgrade; and \
	sudo apt-get -y dist-upgrade; and \
	sudo apt-get -y autoremove; and \
	sudo apt-get -y remove (deborphan)
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
