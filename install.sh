#!/bin/bash
if [ -z "$1" ]; then
    echo 'Need a valid PATH to install to.'
    exit 0
fi

read -p "Install to $1? [y/N]: " CONTINUE;
if [ "$CONTINUE" == "Y" ] | [ "$CONTINUE" == "y" ]; then
    echo "Installing to $1"
    cp chex "$1"
    cp hex "$1"
    cp stringhex "$1"
    cp dump "$1"
    cp plt "$1"
    cp newasm "$1"
else
    echo "exiting"
    exit 0
fi
