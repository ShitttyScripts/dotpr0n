# Neovim as Vim
function vim
    command nvim $argv
end

# Shortcuts
function d
    docker
end

function dl
    cd ~/Downloads
end

function dt
    cd ~/Desktop
end

function e
    nvim -w
end

function g
    git $argv
end

function h
    history $argv
end

function j
    jobs $argv
end

function p
    cd ~/Projekte
end

function v
    vifm $argv
end

# Git shortcuts
function gd
    git diff | nvim
end

function ga
    git add $argv
end

function gi
    git ignore $argv
end

function gbd
    git branch -D $argv
end

function gst
    git status $argv
end

function gc
    git commit $argv
end

function gca
    git commit -a -m  $argv
end

function gm
    git merge --no-ff $argv
end

function gput
    git push --tags
end

function gpu
    git push $argv
end

function gpua
    git push --all $argv
end

function gpl
    git pull $argv
end

function gplr
    git pull --rebase $argv
end

function grh
    git reset --hard $argv
end

function gb
    git branch $argv
end

function gcob
    git checkout -b $argv
end

function gco
    git checkout $argv
end

function gcom
    git checkout master $argv
end

function gba
    git branch -a $argv
end

function gcp
    git cherry-pick $argv
end

function gl
    git log --pretty=format:"%Cgreen%h%Creset %an - %s" --graph $argv
end

function gpom
    git pull origin master $argv
end

function gcd
    cd (git rev-parse --show-toplevel) $argv
end

# Taskwarrior shortcuts
function t
    task $argv
end

function ta
    task add $argv
end

function tl
    task list $argv
end

# tmux shortcuts
function txa
    tmux attach-session -t $argv
end

function txk
    tmux kill-session -t $argv
end

function txl
    tmux ls $argv
end

# dtrx shortcut
function x
    dtrx -v $argv
end

# Docker
function docker-clean
    docker rmi -f (docker images -q -a -f dangling=true)
end

# Ansiweather
function weather
    ansiweather
end

# Sane cat for Markdown files
function mdcat
    pandoc -f markdown -t plain $argv
end

# Detect which `ls` flavor is in use
# if ls --color > /dev/null 2>&1 # GNU `ls`
#     set -x colorflag "--color"
# else # OS X `ls`
#     set -x colorflag "-G"
# end
#
# # List all files colorized in long format
# function l
#     ls -lF $colorflag
# end
#
# # List all files colorized in long format, including dot files
# function la
#     ls -laF $colorflag
# end
#
# # List only directories
# function lsd
#     ls -lF $colorflag | grep --color=never '^d'
# end

# Get week number
function week
    date +%V
end

# IP addresses
function extip
    dig +short myip.opendns.com @resolver1.opendns.com
end

function locip
    ipconfig getifaddr en0
end

function ips
    ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'
end

# Flush Directory Service cache
function flush
    dscacheutil -flushcache; and killall -HUP mDNSResponder
end

# Clean up LaunchServices to remove duplicates in the “Open With” menu
function lscleanup
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder
end

# Serve folder via HTTP
function http-serve
    python -m SimpleHTTPServer
end

# View HTTP traffic
function sniff
    sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'
end

function httpdump
    sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\"
end

# List file sizes in human-readable format
function sizes
    du -sh * | sort -n
end

# Listening ports
function openports
    switch (uname)
        case Darwin
            lsof -i | grep LISTEN
        case '*'
            netstat -nlp
    end
end

# Canonical hex dump; some systems have this symlinked
# command -v hd > /dev/null; or alias hd "hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null; or alias md5sum "md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null; or alias sha1sum "shasum"

# Recursively delete `.DS_Store` files
function cleanup
    find . -type f -name '*.DS_Store' -ls -delete
end

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
function emptytrash
    sudo rm -rfv /Volumes/*/.Trashes; \
    and sudo rm -rfv ~/.Trash; \
    and sudo rm -rfv /private/var/log/asl/*.asl
end

# Show/hide hidden files in Finder
function show
    defaults write com.apple.finder AppleShowAllFiles -bool true; \
    and killall Finder
end

function hide
    defaults write com.apple.finder AppleShowAllFiles -bool false; \
    and killall Finder
end

# Hide/show all desktop icons (useful when presenting)
function hidedesktop
    defaults write com.apple.finder CreateDesktop -bool falsel; \
    and killall Finder
end

function showdesktop
    defaults write com.apple.finder CreateDesktop -bool true; \
    and killall Finder
end

# URL-encode strings
function urlencode
  python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"
end

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
function mergepdf
  /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py
end

# Disable Spotlight
function spotoff
    sudo mdutil -a -i off
end
# Enable Spotlight
function spoton
    sudo mdutil -a -i on
end

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
function plistbuddy
    /usr/libexec/PlistBuddy
end

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
function badge
    tput bel
end

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
function map
    xargs -n1
end

# Lock the screen (when going AFK)
function afk
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

# Output all open ports (does not work in Mac OS X)
# alias openports "netstat -tulpn"

function c
    clear
end

function bc
    command bc -l
end

function sha1
    openssl sha1
end

# function mkdir
#     command mkdir -pv $argv
# end

# Get web server headers
function header
    curl -I
end

# Find out if remote server supports gzip / mod_deflate or not
function headerc
    curl -I --compress
end
