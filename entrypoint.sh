#!/bin/bash
if [ -z "$HOST_USER" ]; then
    echo "Error: please specify $HOST_USER to run this docker image"
    exit 1
fi
/root/add_user.sh
/root/enable_docker.sh
USER=$HOST_USER gosu $HOST_USER /opt/setup_vnc.sh
exec /root/exec_as_host_user_or_root.sh "$@"
