#!/usr/bin/env -S bash

set -xueo pipefail

dir=$(dirname $(readlink -f $0))

sudo systemctl start unit


sudo cp *.py /var/log/unit/

sudo curl -X PUT --data-binary "$(cat $dir/setup-wsgi.json)" \
--unix-socket /var/run/unit/control.sock http://localhost/config/

sudo systemctl restart unit

