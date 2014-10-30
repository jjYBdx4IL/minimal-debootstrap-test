#!/bin/bash

set -Eeux
set -o pipefail

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

