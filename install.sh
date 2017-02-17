#!/bin/sh

pkg install bash git zsh && \
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick && \
git clone --recurse-submodules https://github.com/herrbischoff/dotfiles.git ~/.homesick/repos/dotfiles && \
~/.homesick/repos/homeshick/bin/homeshick link && \
zsh && \
source ~/.zshrc
