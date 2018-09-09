#!/bin/bash
# Create a user with given HOST_USER, HOST_UID, HOST_GID
if [ -z "$HOST_USER" ]; then
    echo "HOST_USER is not specified, cannot create user"
    exit 1
fi
if [ -z "$HOST_UID" ]; then
    echo "HOST_UID is not specified, cannot create user"
    exit 1
fi
if [ -z "$HOST_GID" ]; then
    echo "HOST_UID is not specified, cannot create user"
    exit 1
fi
addgroup --gid $HOST_GID $HOST_USER
adduser --gid $HOST_GID --uid $HOST_UID --disabled-password --gecos '' $HOST_USER 
# home directory: fix permisions
chown $HOST_UID:$HOST_GID /home/$HOST_USER
#   new home directory - copy from /etc/skel if empty
HOME_DIR_MARKER="/home/$HOST_USER/.docker_home_dir_init"
if [ ! -e "$HOME_DIR_MARKER" ]; then
    touch "$HOME_DIR_MARKER"
    gosu $HOST_USER cp -r /etc/skel/. /home/$HOST_USER
fi
# add .hgrc if does not exist
HGRC_PATH=/home/$HOST_USER/.hgrc
if [ ! -e $HGRC_PATH ]; then
    # add basic username; and trust (remove when we have active directory working)
    cat <<EOF > $HGRC_PATH
[ui]
username=$HOST_USER
[trusted]
users=*
EOF
    chown $HOST_UID:$HOST_GID $HGRC_PATH
fi
