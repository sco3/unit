#!/usr/bin/env -S bash

set -xueo pipefail

dir=$(dirname $(readlink -f $0))

sudo systemctl restart unit

yq -i -P -o json ".applications.python.path=\"${dir}/\""              setup-wsgi.json
yq -i -P -o json ".applications.python.home=\"${dir}/.venv/\""        setup-wsgi.json
yq -i -P -o json ".applications.python.working_directory=\"${dir}/\"" setup-wsgi.json



sudo curl -X PUT --data-binary "$(cat $dir/setup-wsgi.json)" \
--unix-socket /var/run/unit/control.sock http://localhost/config/

sudo systemctl restart unit

sudo tail -f -n 40 /var/log/unit/unit.log
