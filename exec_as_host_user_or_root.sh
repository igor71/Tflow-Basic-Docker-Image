#!/bin/bash
# Run given commands as $HOST_USER (if exists), or root
# Also run as root if specified explicitly in the first argument
if [ $# -gt 0 ] && [ "$1" = "root" ]; then
    exec /root/exec_as_user.sh "$@"
fi
if [ -n "$HOST_USER" ]; then
    exec /root/exec_as_user.sh $HOST_USER "$@"
else
    echo 'No HOST_USER specified, running as root'
    exec /root/exec_as_user.sh root "$@"
fi
