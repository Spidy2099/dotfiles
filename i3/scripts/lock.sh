#!/bin/sh

#This is a script to display with Blurry Effect when lock the screen using packges imagemagick and scrot, and i3lock
img=/tmp/i3lock.png

scrot $img
convert $img -scale 10% -scale 1000% $img

i3lock -u -i $img
