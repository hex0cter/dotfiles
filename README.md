# dotfiles
This repository represents my dot files. It works on both Debian based Linux and MacOS. Feel free to use.

## What is included
* [tmux](https://github.com/tmux/tmux) with prefix `ctrl + q`
* [lf](https://github.com/gokcehan/lf)
* [pistol](https://github.com/doronbehar/pistol)
* [autojump](https://github.com/wting/autojump)
* [fzf](https://github.com/junegunn/fzf)
* [zsh](https://www.zsh.org/)
* [oh-my-zsh](https://ohmyz.sh/)
* [nvm](https://github.com/nvm-sh/nvm) with the latest nodejs
* [pyenv](https://github.com/pyenv/pyenv) with the latest python3
* other utilities, such as imgcat, yarn, trash, etc.

## Installation
You can install this repository using `wget`:
```bash
bash -c "$(wget https://raw.githubusercontent.com/hex0cter/dotfiles/master/.install.sh -O -)"
```
or using `curl`:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/hex0cter/dotfiles/master/.install.sh)"
```

You might need to fill in your sudo password during software installation and changing shell.

## How to use
For file browsing, type `lf`.

For file searching, type `f`.

To enter a historical directory, type `c`.

To search a historical commmand, type `h`.

To start or attach to a tmux session, type `t`. Type `ctrl q |` to split the window vertically. Type `ctrl q -` to split the window horizontally.

`rm` will be aliased to `trash`.

## References
* https://www.atlassian.com/git/tutorials/dotfiles
