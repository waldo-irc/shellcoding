#!/bin/bash
read -p "Uninstall? [y/N]: " CONTINUE;
if [ "$CONTINUE" == "Y" ] | [ "$CONTINUE" == "y" ]; then
    first=$(which chex)
    rm "$first"
    second=$(which hex)
    rm "$second"
    third=$(which stringhex)
    rm "$third"
    fourth=$(which plt)
    rm "$fourth"
    fifth=$(which dump)
    rm "$fifth"
    sixth=$(which newasm)
    rm "$sixth"
    echo "Done!  Removed the files, unless you changed their names!"
else
    echo "exiting"
    exit 0
fi
