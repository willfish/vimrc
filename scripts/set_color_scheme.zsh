#!/bin/sh
#
# Enable dynamic color changing
# https://shuheikagawa.com/blog/2020/02/14/switching-colorschemes-of-vim-and-alacritty/

color=$1
dotfiles= dirname `pwd`
alacritty=${dotfiles}/alacritty

configure_alacritty() {
  cat ${alacritty}/base.yml ${alacritty}/${color}.yml > ${dotfiles}/.alacritty.yml
}

configure_vim() {
  echo $1 > ${dotfiles}/.vim/color.vim
}

case $color in
  dracula)
    configure_alacritty
    configure_vim 'colorscheme dracula'
    ;;
  nord)
    configure_alacritty
    configure_vim 'colorscheme nord'
    ;;
  pink-moon)
    configure_alacritty
    configure_vim 'colorscheme pink-moon'
    ;;
  ayu-light)
    configure_alacritty
    configure_vim 'let ayucolor="light"\ncolorscheme ayu'
    ;;
  *)
    echo "Supported colorschemes: dracula, nord, pink-moon, ayu-light"
    exit 1
    ;;
esac
