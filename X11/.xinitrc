# Load the settings of gerneral X service
xrdb -merge $HOME/.config/X11/.Xresources

# Run the daemon urxvtd at the beginning of the X service
#-o(opendisplay) keep the daemon process running at all time
#-q(queit) disable welcome message of URxvt
#-f(fork) Bound URxvt to its control socket
urxvtd -o -q -f 

# `setxkmap` will switch the Cap key with Ctrl key when press Cap key with other keys, `xcape` will physically switch Cap to Esc when press the Cap by itself
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'&

# Run i3-wm
exec i3
