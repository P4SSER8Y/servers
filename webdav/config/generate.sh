#!/usr/bin/env sh

if [ -z $1 ]; then
    echo "Usage: ./generate.sh <USERNAME>"
else
    touch $(dirname $0)/user.passwd.deleteme
    touch $(dirname $0)/user.passwd

    PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)
    echo $PASSWORD | htpasswd -Bpi $(dirname $0)/user.passwd.deleteme $1
    echo $PASSWORD | htpasswd -Bi $(dirname $0)/user.passwd $1
fi
