#!/bin/bash
# to enable container restart, remove old VNC locks
vncserver -kill :$VNC_DISPLAY && rm -rfv /tmp/.X*
# HACK: fix path
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
# Run vnc server
vncserver :$VNC_DISPLAY -geometry $VNC_GEOMETRY
sleep 1
exec tail -F $HOME/.vnc/*.log  $HOME/.xsession-errors
