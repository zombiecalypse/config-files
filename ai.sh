#!/bin/sh

echo "$@" | sed 's/ \+/\n/g' >> ~/config/installed
sudo apt-get install "$@"
