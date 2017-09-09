#
# Update functions
#

function __freebsd_portmaster
	printf "\n===[ Upgrade Software ] ===================================\n"; and \
	portmaster -ad; and \
	portmaster -y --clean-distfiles
end

function __freebsd_pkg
	printf "\n===[ Upgrade Software ] ===================================\n"; and \
	pkg update; and \
	pkg upgrade
end

function __freebsd_synth
	printf "\n===[ Compile and Upgrade Software ]========================"; and \
	synth upgrade-system
end

function __freebsd_portsnap
    printf "\n===[ Update Ports ]========================================\n"; and \
    portsnap fetch update
end

function __freebsd_freebsd-update
	printf "===[ System Software Update ]==============================\n"; and \
	freebsd-update fetch; and \
	freebsd-update install
end

function __freebsd_source
	printf "===[ Update System Sources ]===============================\n"; and \
	svnlite update /usr/src
end

function __update_npm
	if which npm
        printf "\n===[ npm ]=================================================\n"; and \
        npm upgrade -g
    end
end

function __update_gems
    if which gem
        printf "===[ Gems ]================================================\n"; and \
        gem update; and \
        gem cleanup
    end
end

function __macos_software_update
	printf "\n===[ Apple Software Update ]===============================\n"; and \
	sudo softwareupdate -i -a
end

function __macos_appstore
	printf "\n===[ App Store ]===========================================\n"; and \
	mas upgrade
end

function __macos_macports
	printf "\n===[ MacPorts ]============================================\n"; and \
	sudo port selfupdate; and \
	sudo port outdated; and \
	sudo port upgrade outdated; and \
	sudo port uninstall leaves
	port uninstall inactive
end

function __macos_homebrew
	printf "\n===[ Homebrew ]============================================\n"; and \
	brew update; and \
	brew upgrade --cleanup; and \
	brew upgrade --fetch-HEAD universal-ctags kakoune vis; and \
	brew cleanup -s; and \
	brew prune
end

function __macos_update_pip
	printf "\n===[ pip ]=================================================\n"; and \
	python2 -m pip_review --auto
	python3 -m pip_review --auto
end

function __debian_apt
	printf "\n===[ apt-get ]=============================================\n"; and \
	sudo apt-get update; and \
	sudo apt-get -y upgrade; and \
	sudo apt-get -y dist-upgrade; and \
	sudo apt-get autoremove
	if which deborphan
        sudo apt-get remove (deborphan)
    end
end

#####

function update --description 'Update system software'
	switch (uname)
		case Darwin
			__macos_software_update
			__macos_appstore
			__macos_homebrew
			__update_npm
			__update_gems
			__macos_update_pip
		case Linux
			__debian_apt
			__update_npm
			__update_gems
		case FreeBSD
			if [ "$argv[1]" = "jail" ]
                __freebsd_portmaster
                __update_npm
                __update_gems
            else
                __freebsd_portsnap
                __freebsd_portmaster
                __update_npm
                __update_gems
            end
		case '*'
			printf "No update function for %s yet." (uname)
	end
end
