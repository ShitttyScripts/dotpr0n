#
# Update functions
#

function __freebsd_portmaster
	printf "\n===[ Upgrade Software ] ===================================\n"; and \
	portmaster -aBd; and \
	portmaster -y --clean-distfiles
end

function __freebsd_pkg
	printf "\n===[ Upgrade Software ] ===================================\n"; and \
	pkg update; and \
	pkg upgrade
end

function __freebsd_synth
	printf "\n===[ Compile and Upgrade Software ]========================\n"; and \
	synth upgrade-system
end

function __freebsd_portsnap
    printf "\n===[ Update Ports tree ]===================================\n"; and \
    portsnap fetch update
end

function __freebsd_ezjail_ports
	if which ezjail-admin > /dev/null
        printf "\n===[ Update ezjail Ports tree ]============================\n"; and \
        ezjail-admin update -P
    end
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
	if which npm > /dev/null
        printf "\n===[ npm ]=================================================\n"; and \
        npm upgrade -g
    end
end

function __update_yarn
	if which npm > /dev/null
        printf "\n===[ yarn ]================================================\n"; and \
        yarn global upgrade
    end
end

function __update_gems
    if which gem > /dev/null
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
    if which mas > /dev/null
        printf "\n===[ App Store ]===========================================\n"; and \
        mas upgrade
    end
end

function __macos_macports
    if which port > /dev/null
        printf "\n===[ MacPorts ]============================================\n"; and \
        sudo port selfupdate; and \
        sudo port outdated; and \
        sudo port upgrade outdated; and \
        sudo port uninstall leaves
        port uninstall inactive
    end
end

function __macos_homebrew
    if which brew > /dev/null
        printf "\n===[ Homebrew ]============================================\n"; and \
        brew update; and \
        brew upgrade --cleanup; and \
        # brew upgrade --fetch-HEAD universal-ctags; and \
        brew cleanup -s; and \
        brew prune
    end
end

function __update_pip
	printf "\n===[ pip ]=================================================\n"; and \
	python -m pip_review --auto
end

function __debian_apt
	printf "\n===[ apt-get ]=============================================\n"; and \
	sudo apt update; and \
	sudo apt upgrade
end

#####

function update --description 'Update system software'
	switch (uname)
		case Darwin
			__macos_software_update
			__macos_appstore
			__macos_homebrew
			__update_yarn
			__update_gems
			__update_pip
		case Linux
			__debian_apt
			__update_npm
			__update_gems
			__update_pip
		case FreeBSD
			if [ "$argv[1]" = "jail" ]
                __freebsd_portmaster
                __update_npm
                __update_gems
                __update_pip
            # else if [ (uname -p) = "armv6" ]
            #     __freebsd_portsnap
            #     __freebsd_portmaster
            #     __update_npm
            #     __update_gems
            #     __update_pip
            else
                __freebsd_portsnap
                __freebsd_ezjail_ports
                __freebsd_pkg
                __update_npm
                __update_gems
                __update_pip
            end
		case '*'
			printf "No update function for %s yet." (uname)
	end
end
