#!/bin/env bash

ADC_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADC_HOME=$ADC_HOME/..
ADC_HADOOP=$ADC_HOME/deploy/hadoop-0.20.205.0
ADC_ZOOKEEPER=$ADC_HOME/deploy/zookeeper-3.3.5
ADC_ACCUMULO=$ADC_HOME/deploy/accumulo-1.4.1

# initialize Hadoop
#$ADC_HADOOP/bin/hadoop namenode -format < yes
$ADC_HADOOP/bin/hadoop namenode -format

# start Hadoop, Zookeeper
$ADC_HADOOP/bin/start-all.sh
$ADC_ZOOKEEPER/bin/zkServer.sh start

# Init Accumulo
#$ADC_ACCUMULO/bin/accumulo init < `echo "accumulo"; echo "secret"; echo "secret"`

# Start Accumulo
$ADC_ACCUMULO/bin/start-all.sh

# Open the accumulo monitor page
command xdg-open http://localhost:50095/ > /dev/null 2>&1  || { echo "Accumulo Monitor: http://localhost:50095"; }

# Start a shell
$ADC_ACCUMULO/bin/accumulo shell -u root -p secret


