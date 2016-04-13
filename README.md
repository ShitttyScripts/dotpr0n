# Herr Bischoff's Dotfiles

## Install

```bash
git clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone herrbischoff/dotfiles
curl -sL get.fisherman.sh | fish
switch (uname)
    case Darwin
        fisher i brew cask osx bass battery fzf get hash pure replace spin ssh herrbischoff/fish-ssh-agent tmux z
    case '*'
        fisher i bass battery fzf get hash pure replace spin ssh herrbischoff/fish-ssh-agent tmux z
end
source ~/.config/fish/config.fish
brew tap homebrew/bundle
hcd
brew bundle
```
