#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X11 with login
if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
  startx
fi
