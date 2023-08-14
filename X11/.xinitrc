# Load the settings of gerneral X service
xrdb -merge $HOME/.config/X11/.Xresources

# Run the daemon urxvtd at the beginning of the X service
#-o(opendisplay) keep the daemon process running at all time
#-q(queit) disable welcome message of URxvt
#-f(fork) Bound URxvt to its control socket
urxvtd -o -q -f 

# Run i3-wm
exec i3
