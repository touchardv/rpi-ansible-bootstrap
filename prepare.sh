#!/bin/bash

# the path to the mounted boot disk
TARGET=$1

touch $TARGET/ssh
cp templates/wpa_supplicant.conf $TARGET/