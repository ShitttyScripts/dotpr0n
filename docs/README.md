# Herr Bischoff's Own Dotfiles

I'm a bit obsessive about my dotfiles and have gathered the most important pieces here.

This repository is managed by [yadm](https://github.com/TheLocehiliosan/yadm).

[fish](https://www.fishshell.com) is my interactive shell of choice. For scripting, I largely target `sh`, for portability. I was a long-time user of plain Bash, then Zsh and finally settled on fish. It breaks with Bash compatibility where usability can be improved and needs some getting used to. Once you are, it truly feels like the *command line shell for the 90s* it's claiming to be. fish offers some great simplifications for scripting as well. For ad-hoc scripting, I use it almost exclusively.

Obviously, you're not going to just dump the bulk of my dotfiles to your local system in one go. Feel free to peruse the repository and take what you need. I always love to see what other people have in their configurations and let me be inspired.

## Requirements

fish >= 2.5.x

## Install

### Use fish
```fish
mkdir ~/bin && \
curl -fLo ~/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && \
chmod a+x ~/bin/yadm && \
~/bin/yadm clone git@github.com:herrbischoff/dotpr0n.git && \
source ~/.config/fish/config.fish
```

## Optional

### Neovim
```fish
pip install --user neovim python-language-server vim-vint yamllint
yarn global add babel-eslint eslint eslint-plugin-html eslint-plugin-vue javascript-typescript-langserver prettier pug-lint stylelint svgo vue-language-server
vi +PlugInstall +UpdateRemotePlugins
```

### yarn
```fish
curl -o- -L https://yarnpkg.com/install.sh | bash
```

### pyenv

```fish
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

#### Debian/Ubuntu

```fish
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
pyenv install 3.6.4
pyenv global 3.6.4
```

#### macOS

```fish
brew install readline xz
pyenv install 3.6.4
pyenv global 3.6.4
```

### rvm
```fish
curl -sSL https://get.rvm.io | bash -s stable
```

### acme.sh
```fish
curl https://get.acme.sh | sh
```
