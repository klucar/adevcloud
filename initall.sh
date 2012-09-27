#!/bin/env bash

ADC_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADC_HADOOP=$ADC_HOME/hadoop-0.20.203.1-SNAPSHOT
ADC_ZOOKEEPER=$ADC_HOME/zookeeper-3.3.6
ADC_ACCUMULO=$ADC_HOME/accumulo-1.4.1

# initialize Hadoop
$ADC_HADOOP/bin/hadoop namenode -format < yes

# start Hadoop, Zookeeper
$ADC_HADOOP/bin/start-all.sh
$ADC_ZOOKEEPER/bin/zkServer.sh start


# Init Accumulo
$ADC_ACCUMULO/bin/accumulo init < `echo "accumulo"; echo "secret"; echo "secret"`

# Start Accumulo
$ADC_ACCUMULO/bin/start-all.sh

# Start a shell
$ADC_ACCUMULO/bin/accumulo shell -u root -p secret


