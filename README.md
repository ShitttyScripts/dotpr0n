## Requirements

fish >= 2.4.x

## Install

### Use fish
```sh
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
\curl -sSL https://get.rvm.io | bash -s stable
~/.homesick/repos/homeshick/bin/homeshick clone herrbischoff/dotfiles
source ~/.config/fish/config.fish
```

## Optional

### macOS
```sh
homeshick clone herrbischoff/castle-macos
```

### mutt
```sh
homeshick clone herrbischoff/castle-mutt
```

### cmus
```sh
homeshick clone herrbischoff/castle-cmus
```

### Neovim
```sh
homeshick clone herrbischoff/castle-neovim
vi +PlugInstall
```
