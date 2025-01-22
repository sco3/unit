#!/usr/bin/env -S bash

set -xueo pipefail

dir=$(dirname $(readlink -f $0))

sudo systemctl start unit

yq -i ".applications.python.path=\"${dir}/\"" setup-asgi.json
yq -i ".applications.python.home=\"${dir}/.venv/\"" setup-asgi.json
yq -i ".applications.python.working_directory=\"${dir}/\"" setup-asgi.json


#sudo cp *.py /var/log/unit/

sudo curl -X PUT --data-binary "$(cat $dir/setup-wsgi.json)" \
--unix-socket /var/run/unit/control.sock http://localhost/config/

sudo systemctl restart unit

sudo tail -f -n 40 /var/log/unit/unit.log
