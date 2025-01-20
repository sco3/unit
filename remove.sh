#!/usr/bin/env -S bash

set -xueo pipefail

dir=$(dirname $(readlink -f $0))

sudo systemctl start unit



sudo curl -X PUT --data-binary "$(cat $dir/remove.json)" \
--unix-socket /var/run/unit/control.sock http://localhost/config/
