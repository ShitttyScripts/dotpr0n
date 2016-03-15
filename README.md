# Herr Bischoff's Dotfiles

## Install

```bash
git clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone herrbischoff/dotfiles
~/.homesick/repos/homeshick/bin/homeshick link dotfiles
curl -sL get.fisherman.sh | fish
switch (uname)
    case Darwin
        fisher i brew cask osx
    case '*'
        fisher i bass battery fzf get hash pure replace spin ssh herrbischoff/ssh-agent tmux z
end
source ~/.config/fish/config.fish
```
