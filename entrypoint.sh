#!/bin/sh

if [ ! -f "/config/mopidy.conf" ]
then
    cp /etc/default/mopidy.conf  /config/mopidy.conf
fi

mopidy --config /config/mopidy.conf
