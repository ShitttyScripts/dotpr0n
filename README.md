# Herr Bischoff's Dotfiles

## Install

```bash
git clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone herrbischoff/dotfiles
mkdir -p ~/.config/fish/functions
curl -sL git.io/fin > ~/.config/fish/functions/fin.fish
fin
source ~/.config/fish/config.fish
brew tap homebrew/bundle
hcd
brew bundle
```
