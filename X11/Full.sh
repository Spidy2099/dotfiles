#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-1 --mode 2048x1152 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off
urxvtc --font "xft:DejaVuSansMono:size=12:antialias=true" &
