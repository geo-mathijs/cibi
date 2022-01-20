#!/bin/bash

sudo mkdir -p /usr/local/etc/cibi
sudo touch /usr/local/etc/cibi/patch.state
sudo chmod 666 /usr/local/etc/cibi/patch.state
echo "Bump Security String to 2021-12-05" > /usr/local/etc/cibi/patch.state

sudo cp ./cibi /usr/local/bin/

if ! crontab -l | grep -q -Fx "0 0 * * 2 /usr/local/bin/cibi"; then
    crontab -l | { cat - | grep -v "^$" ; echo -e "0 0 * * 2 /usr/local/bin/cibi\n"; } | crontab -
fi
