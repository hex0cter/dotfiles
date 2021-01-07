#!/usr/bin/env bash

install_linux() {
  echo "install linux"
}

install_macos() {
  echo "install macos"
}

os=$(uname)
if [ "$os" == "Linux" ]
then
  install_linux
elif [ "$os" == "Darwin" ]
then
  install_macos
fi
