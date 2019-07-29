# Neovim as Vim
abbr --add vconf 'nvim ~/.config/nvim/init.vim'
abbr --add vplug 'cd ~/.config/nvim/plugins'
abbr --add vit 'nvim ~/.taskpaper/current.taskpaper'

# fish
abbr --add fconf 'nvim ~/.config/fish/config.fish'
abbr --add aconf 'nvim ~/.config/fish/abbreviations.fish; and for a in (abbr -l); abbr -e $a; end; and source ~/.config/fish/abbreviations.fish'

# Shortcuts
abbr --add dl 'cd ~/Downloads'
abbr --add dt 'cd ~/Desktop'
abbr --add f 'fossil'
abbr --add g 'git'
abbr --add j 'jobs'
abbr --add v 'vifm'
abbr --add d 'docker'
abbr --add duck 'cd ~/Library/Group\ Containers/G69SCX94XU.duck/Library/Application\ Support/duck/Volumes/'
abbr --add x 'exit'
abbr --add y 'yadm'

# Homeshick
abbr --add h 'homeshick'
abbr --add hcd 'cd ~/.homesick/repos'
abbr --add hsu 'homeshick pull; and homeshick link'

# Mutt
abbr --add m 'mutt'

# Fossil shortcuts
abbr --add fst 'fossil status'
abbr --add fc 'fossil commit'

# Git shortcuts
abbr --add ga 'git add'
abbr --add gaa 'git add .'
abbr --add gb 'git branch'
abbr --add gba 'git branch -a'
abbr --add gbd 'git branch -D'
abbr --add gbl 'git branch | grep "*" | sed "s/* //"'
abbr --add gc 'git commit'
abbr --add gca 'git commit -a'
abbr --add gcd 'cd (git rev-parse --show-toplevel)'
abbr --add gco 'git checkout'
abbr --add gcob 'git checkout -b'
abbr --add gcod 'git checkout development'
abbr --add gcom 'git checkout master'
abbr --add gcp 'git cherry-pick'
abbr --add gcs 'git commit -sS'
abbr --add gd 'git diff'
abbr --add gfp 'git fetch --prune'
abbr --add gi 'git ignore'
abbr --add gl "git log --pretty='format:%C(Yellow)%h%Creset %C(Blue)%ar%Creset %an - %s' --graph"
abbr --add gm 'git merge --no-ff'
abbr --add gpoh 'git push origin HEAD'
abbr --add gpull 'git pull'
abbr --add gpush 'git push'
abbr --add grh 'git reset --hard'
abbr --add gst 'git status'
abbr --add gt 'git tag'
abbr --add gts 'git tag -s'
abbr --add lg 'lazygit'
abbr --add ts 'tig status'

# yadm shortcuts
abbr --add ya 'yadm add'
abbr --add yc 'yadm commit'
abbr --add yd 'yadm diff'
abbr --add yst 'yadm status'

# Taskwarrior shortcuts
# abbr --add t 'task'
# abbr --add ta 'task add'
# abbr --add tl 'task list'

# npm shortcuts
abbr --add nls 'npm list --depth=0'

# fzf
abbr --add preview 'fzf --preview \'head -100 {}\''

# Glances
abbr --add glances 'sudo glances --disable-bg --disable-check-update'

# Get week number
abbr --add week 'date +%V'

# IP addresses
abbr --add extip 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr --add locip 'ipconfig getifaddr en0'

# Flush Directory Service cache
abbr --add flush 'dscacheutil -flushcache; and killall -HUP mDNSResponder'

# Clean up LaunchServices to remove duplicates in the “Open With” menu
abbr --add lscleanup '/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user; and killall Finder'

# View HTTP traffic
abbr --add sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

# List file sizes in human-readable format
abbr --add sizes 'du -sh * | sort -n'

# Recursively delete `.DS_Store` files
abbr --add dsclean "find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
abbr --add show 'defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder'
abbr --add hide 'defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder'

# Hide/show all desktop icons (useful when presenting)
abbr --add hidedesktop 'defaults write com.apple.finder CreateDesktop -bool false; and killall Finder'
abbr --add showdesktop 'defaults write com.apple.finder CreateDesktop -bool true; and killall Finder'

# URL-encode strings
abbr --add urlencode 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
abbr --add mergepdf '/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
abbr --add spotoff 'sudo mdutil -a -i off'
# Enable Spotlight
abbr --add spoton 'sudo mdutil -a -i on'

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
abbr --add plistbuddy '/usr/libexec/PlistBuddy'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
abbr --add badge 'tput bel'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
abbr --add map 'xargs -n1'

# Lock the screen (when going AFK)
abbr --add afk '/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

abbr --add c 'clear'
abbr --add bc 'bc -l'
abbr --add sha1 'openssl sha1'
abbr --add mkdir 'mkdir -pv'
abbr --add j 'jobs -l'

# Get web server headers
abbr --add header 'curl -I'

# Find out if remote server supports gzip / mod_deflate or not
abbr --add headerc 'curl -I --compress'

# USB Serial
abbr --add usbserial "screen /dev/tty.usbserial 115200"
