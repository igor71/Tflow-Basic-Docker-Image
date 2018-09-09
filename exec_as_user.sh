#!/bin/bash
# Run given command as user
# Usage: run_as_user.sh <user> <commands....>
# If no arguments are given, run /bin/bash
if [ $# -le 0 ]; then
    echo "ERROR: no user given"
    echo "Usage: $0 <user> <commands...>"
    exit 1
fi
RUN_AS="$1"
shift
# No commands: run bash
[[ $# -eq 0 ]] && set -- "/bin/bash"
# Execute
echo Executing as $RUN_AS: "$@" 
if [[ "$RUN_AS" == "root" ]]; then
    cd /root
    exec "$@"
else
    cd /home/$RUN_AS
    USER=$RUN_AS exec gosu $RUN_AS "$@"
fi
