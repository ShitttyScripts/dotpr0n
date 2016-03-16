# Neovim as Vim
alias vim 'nvim'

# Shortcuts
alias d 'docker'
alias dl 'cd ~/Downloads'
alias dt 'cd ~/Desktop'
alias e 'nvim -w'
alias g 'git'
alias h 'history'
alias j 'jobs'
alias p 'cd ~/Projekte'
alias v 'vifm'

# Git shortcuts
alias ga 'git add'
alias gaa 'git add --all'
alias gb 'git branch'
alias gba 'git branch -a'
alias gbd 'git branch -D'
alias gbl 'git blame -b -w'
alias gc 'git commit -v'
alias gc! 'git commit -v --amend'
alias gca 'git commit -v -a'
alias gca! 'git commit -v -a --amend'
alias gcam 'git commit -a -m'
alias gcan! 'git commit -v -a -s --no-edit --amend'
alias gcd 'cd (git rev-parse --show-toplevel)'
alias gcl 'git clone --recursive'
alias gclean 'git clean -fd'
alias gco 'git checkout'
alias gcob 'git checkout -b'
alias gcom 'git checkout master'
alias gcp 'git cherry-pick'
alias gcs 'git commit -S'
alias gd 'git diff'
alias gdca 'git diff --cached'
alias gdct 'git describe --tags (git rev-list --tags --max-count 1)'
alias gdt 'git diff-tree --no-commit-id --name-only -r'
alias gdw 'git diff --word-diff'
alias gf 'git fetch'
alias gfa 'git fetch --all --prune'
alias gfo 'git fetch origin'
alias gi 'git ignore'
alias gl 'git log --pretty=format:"%Cgreen%h%Creset %an - %s" --graph'
alias gm 'git merge'
alias gmom 'git merge origin/master'
alias gmum 'git merge upstream/master'
alias gp 'git push'
alias gpa 'git push --all'
alias gpl 'git pull'
alias gplr 'git pull --rebase'
alias gpoat 'git push origin --all; and git push origin --tags'
alias gpom 'git pull origin master'
alias gpristine 'git reset --hard; and git clean -dfx'
alias gpt 'git push --tags'
alias gpu 'git push upstream'
alias gr 'git remote'
alias gra 'git remote add'
alias grb 'git rebase'
alias grh 'git reset HEAD'
alias grhh 'git reset HEAD --hard'
alias gst 'git status'

# Homeshick shortcuts
alias h 'homeshick'
alias hc 'homeshick cd'
alias hcd 'homeshick cd dotfiles'

# Taskwarrior shortcuts
alias t 'task'
alias ta 'task add'
alias tl 'task list'

# tmux shortcuts
alias txa 'tmux attach-session -t'
alias txk 'tmux kill-session -t'
alias txl 'tmux ls'

# dtrx shortcut
alias x 'dtrx -v'

# Docker
alias docker-clean 'docker rmi -f (docker images -q -a -f dangling=true)'

# Ansiweather
alias weather 'ansiweather'

# Sane cat for Markdown files
alias mdcat 'pandoc -f markdown -t plain'

# Get week number
alias week 'date +%V'

# IP addresses
alias extip 'dig +short myip.opendns.com @resolver1.opendns.com'
alias ips 'ifconfig -a | grep -o "inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)" | awk "{ sub(/inet6? (addr:)? ?/, \"\"); print }"'
alias locip 'ipconfig getifaddr en0'

# Flush Directory Service cache
alias flush 'dscacheutil -flushcache; and killall -HUP mDNSResponder'

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup '/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder'

# Serve folder via HTTP
alias http-serve 'python -m SimpleHTTPServer'

# View HTTP traffic
alias httpdump 'sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\"'
alias sniff 'sudo ngrep -d "en1" -t "^(GET|POST) " "tcp and port 80"'

# List file sizes in human-readable format
alias sizes 'du -sh * | sort -n'

# Listening ports
function openports
    switch (uname)
        case Darwin
            lsof -i | grep LISTEN
        case '*'
            netstat -tulpn
    end
end

# Canonical hex dump; some systems have this symlinked
# command -v hd > /dev/null; or alias hd "hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null; or alias md5sum "md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null; or alias sha1sum "shasum"

# Recursively delete `.DS_Store` files
alias cleanup 'find . -type f -name "*.DS_Store" -ls -delete'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash 'sudo rm -rfv /Volumes/*/.Trashes; and sudo rm -rfv ~/.Trash; and sudo rm -rfv /private/var/log/asl/*.asl'

# Show/hide hidden files in Finder
alias hide 'defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder'
alias show 'defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop 'defaults write com.apple.finder CreateDesktop -bool falsel; and killall Finder'
alias showdesktop 'defaults write com.apple.finder CreateDesktop -bool true; and killall Finder'

# URL-encode strings
alias urlencode 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf '/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff 'sudo mdutil -a -i off'

# Enable Spotlight
alias spoton 'sudo mdutil -a -i on'

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy '/usr/libexec/PlistBuddy'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge 'tput bel'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map 'xargs -n1'

# Lock the screen (when going AFK)
alias afk '/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias bc 'command bc -l'
alias c 'clear'
alias sha1 'openssl sha1'

# function mkdir
#     command mkdir -pv
# end

# Get web server headers
alias header 'curl -I'

# Find out if remote server supports gzip / mod_deflate or not
alias headerc 'curl -I --compress'
