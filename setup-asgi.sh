#!/usr/bin/env -S bash

set -xueo pipefail

dir=$(dirname $(readlink -f $0))

sudo systemctl start unit

yq -i -P -o json ".applications.python.path=\"${dir}/\"" setup-asgi.json
yq -i -P -o json ".applications.python.home=\"${dir}/.venv/\"" setup-asgi.json
yq -i -P -o json ".applications.python.working_directory=\"${dir}/\"" setup-asgi.json

sudo curl -X PUT --data-binary @setup-asgi.json \
--unix-socket /var/run/unit/control.sock http://localhost/config/

sudo systemctl restart unit


echo ============================
echo check logs in /var/log/unit/

sudo tail -f -n 40 /var/log/unit/unit.log

