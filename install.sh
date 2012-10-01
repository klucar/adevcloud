#!/bin/env bash

# This just calls all the necessary scripts to get the system up and running
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$BASE/bin/download.sh
$BASE/bin/config.sh < `echo "\n"; echo "\n"; echo "\n"`
$BASE/bin/init.sh < `echo "Y"; echo "accumulo"; echo "secret"; echo "secret"`

