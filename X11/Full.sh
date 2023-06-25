#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off
urxvtc --font "xft:DejaVuSansMono:size=12:antialias=true" &
