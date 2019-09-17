#!/bin/bash
set -euo pipefail

# adopted from
# https://gist.github.com/audy/26748bdf6f5e260dd6f6

# runs as daemon in background
/opt/smrtanalysis/admin/bin/smrtportald-initd start

# sleep forever to prevent container from exiting
while sleep 1000; do
  echo "hello"
done
