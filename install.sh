#!/bin/env bash

# This just calls all the necessary scripts to get the system up and running
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$BASE/bin/download.sh
$BASE/bin/config.sh
$BASE/bin/init.sh

