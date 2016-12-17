## Requirements

Zsh 5.x

## Install

```zsh
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git clone --recurse-submodules https://github.com/herrbischoff/dotfiles.git ~/.homesick/repos/dotfiles
~/.homesick/repos/homeshick/bin/homeshick link
source ~/.zshrc
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
