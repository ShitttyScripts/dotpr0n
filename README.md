# Herr Bischoff's Own Dotfiles

I'm a bit obsessive about my dotfiles and have gathered the most important pieces here.

This repository and its *castles* work best when using [Homeshick](https://github.com/andsens/homeshick), a pure Bash implementation of [Homesick](https://github.com/technicalpickles/homesick). I don't like the latter one as it depends on Ruby being available. I like to keep my dependencies to a minimum. Give Homeshick a spin, it's quite nice to work with.

[fish](https://www.fishshell.com) is my interactive shell of choice. For scripting, I largely target `sh`, for portability. I was a long-time user of plain Bash, then Zsh and finally settled on fish. It breaks with Bash compatibility where usability can be improved and needs some getting used to. Once you are, it truly feels like the *command line shell for the 90s* it's claiming to be. fish offers some great simplifications for scripting as well. For ad-hoc scripting, I use it almost exclusively.

Obviously, you're not going to just dump the bulk of my dotfiles to your local system in one go. Feel free to peruse the repository and take what you need. I always love to see what other people have in their configurations and let me be inspired.

## Requirements

fish >= 2.4.x

## Install

### Use fish
```sh
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone herrbischoff/dotpr0n
source ~/.config/fish/config.fish
```

## Optional

### pyenv

### Neovim
```sh
homeshick clone herrbischoff/castle-neovim
vi +PlugInstall +UpdateRemotePlugins
```

#### Linux

```sh
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
pyenv install 3.6.3
pyenv global 3.6.3
```

### rvm
```sh
curl -sSL https://get.rvm.io | bash -s stable
```

### yarn
```sh
curl -o- -L https://yarnpkg.com/install.sh | bash
```

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
