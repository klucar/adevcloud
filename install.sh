#!/bin/env bash

# This just calls all the necessary scripts to get the system up and running
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$BASE/bin/download.sh

# do not delete the blank lines below
$BASE/bin/config.sh<<EOF




EOF

# get the new Hadoop environment variables
source ~/.bashrc

# initialize the system.
$BASE/bin/init.sh <<EOF
Y
accumulo
secret
secret
EOF


