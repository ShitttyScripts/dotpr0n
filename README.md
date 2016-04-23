# Herr Bischoff's Dotfiles

## Install

```bash
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
git clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone herrbischoff/dotfiles
source ~/.config/fish/config.fish
hcd
brew bundle
```
