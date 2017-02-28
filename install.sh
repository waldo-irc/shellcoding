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
    path=$(echo "$1" | sed 's/\//\\\//g')
    sed -i -e "s/\/path\/to\/hex/$path\/hex/g" "$1"/chex
    echo "Done!  Read the README.md file to get some help if you don't know how to get started."
else
    echo "exiting"
    exit 0
fi
