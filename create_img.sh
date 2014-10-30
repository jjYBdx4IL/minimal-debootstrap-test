#!/bin/bash

set -Eeu
set -o pipefail

if [ ! "$ROOT_CHECK" = "0" ]; then
   if [ "$(id -u)" != "0" ]; then
       true "ERROR: This must be run as root (sudo)!${reset}"
       exit 1
   else
       true "INFO: Script running as root."
   fi
fi

set -x

distname=precise
tgtdir="$(pwd)/$distname"

apt-get update
apt-get install debootstrap
debootstrap \
    --arch=amd64 \
    --variant=minbase \
    --keyring=/usr/share/keyrings/ubuntu-archive-keyring.gpg \
    $distname $tgtdir \
    http://de.archive.ubuntu.com/ubuntu/

find $tgtdir

