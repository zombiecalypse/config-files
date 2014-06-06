#/bin/sh

REGEX = `echo "$@ | tr -s '\n' '|'
sed -i '/$REGEX/d' ~/config/installed
