#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.pdf) pdftotext "$1" -;;
    *.jpg) echo "$(date) $1" >> /tmp/timg.log && timg "$1";;
    *.jpeg) timg "$1";;
    *.png) pistol "$1" ;;
    *) highlight -O ansi "$1" || cat "$1";;
esac
