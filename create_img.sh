#!/bin/bash

set -Eeux
set -o pipefail

distname=precise
tgtdir="$(pwd)/$distname"

sudo apt-get update
sudo apt-get install debootstrap
sudo debootstrap \
    --arch=amd64 \
    --variant=minbase \
    --keyring=/usr/share/keyrings/ubuntu-archive-keyring.gpg \
    "$distname" "$tgtdir" \
    http://archive.ubuntu.com/ubuntu/

sudo find $tgtdir

