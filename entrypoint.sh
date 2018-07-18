#!/bin/bash
echo $0: pid=$$
echo $# Params: "$@"
if [ -n "$HOST_USER" ] && [ -n "$HOST_UID" ] && [ -n "$HOST_GID" ]; then
    /root/adduser.sh
fi
if [ -n "$DOCKER_GID" ]; then
    addgroup --gid "$DOCKER_GID" docker
    adduser $HOST_USER docker
fi
/root/setup_vnc.sh
# "root" - run as root
if [[ $# -gt 0 ]] && [[ "$1" == "root" ]]; then
    shift
    RUN_AS=root
else
    RUN_AS=$HOST_USER
fi
# No commands: run bash
[[ $# -eq 0 ]] && set -- "/bin/bash"
# Execute
echo Executing as $RUN_AS: "$@" 
if [[ "$RUN_AS" == "root" ]]; then
    cd /root
    exec "$@"
else
    cd /home/$HOST_USER
    USER=$HOST_USER exec gosu $HOST_USER "$@"
fi
