#!/bin/bash
for conf in $(ls dotfiles); do
    ln -sn $PWD/dotfiles/$conf $HOME/.config/$conf
done
