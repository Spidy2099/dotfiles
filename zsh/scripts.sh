#!/bin/zsh

# Use the command `compress` to compress a directory
compress(){
    tar cvzf $1.tar.gz $1
}
