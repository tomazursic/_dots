#!/usr/bin/env bash
# Create soft link for all _* files inside of dir, leaving .bak files.
# Call with "cft" and it link the extra functions

function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
mv $target $target.df.bak
    fi

ln -sf ${source} ${target}
}

function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
unlink ${target}
        mv $target.df.bak $target
    fi
}

if [ "$1" = "restore" ]; then
    for i in _*
    do
        echo " unlink: $i"
        unlink_file $i
    done
    echo " unlink: .ctfunc"
    unlink_file ctfunc
    exit
else
    for i in _*
    do
        echo " link to: $i"
        link_file $i
    done
fi
if [ "$1" = "ctf" ]; then
    echo " link to: .ctfunc"
    link_file ctfunc
fi

echo "Done."
