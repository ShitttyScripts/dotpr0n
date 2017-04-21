## Requirements

Zsh >= 5.x  
fish >= 2.4.x

## Install

### Zsh
```zsh
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git clone --recurse-submodules https://github.com/herrbischoff/dotfiles.git ~/.homesick/repos/dotfiles
~/.homesick/repos/homeshick/bin/homeshick link
source ~/.zshrc
```

### fish
```fish
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git clone https://github.com/herrbischoff/dotfiles.git ~/.homesick/repos/dotfiles
~/.homesick/repos/homeshick/bin/homeshick link
source ~/.config/fish/config.fish
```

## Optional

```zsh
homeshick clone herrbischoff/castle-macos
```

```zsh
homeshick clone herrbischoff/castle-mutt
```

```zsh
homeshick clone herrbischoff/castle-cmus
```

```zsh
homeshick clone herrbischoff/castle-neovim
vi +PlugInstall
```
