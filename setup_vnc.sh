#!/bin/bash
# Set up vnc with default password
mkdir -p $HOME/.vnc
echo $USER | vncpasswd -f > $HOME/.vnc/passwd
chmod 0600 $HOME/.vnc/passwd
touch $HOME/.Xresources
echo Set up vnc for $USER with password $USER
