#!/bin/sh

cd /opt/beef
test -z "$BEEF_USER" || sed -e '/user:/s/"beef"/"'"$BEEF_USER"'"/' -i config.yaml
test -z "$BEEF_PASSWORD" || sed -e '/passwd:/s/"beef"/"'"$BEEF_PASSWORD"'"/' -i config.yaml
exec ./beef "$@"
