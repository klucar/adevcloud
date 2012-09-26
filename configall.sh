#!/bin/env bash

# figure out the install directory
ADC_HOME=/home/jim/code/test/adevcloud
ADC_HADOOP=${ADC_HOME}/hadoop-0.20.203.1-SNAPSHOT
ADC_ZOOKEEPER=${ADC_HOME}/zookeeper-3.3.6
ADC_ACCUMULO=${ADC_HOME}/accumulo-1.4.1

# Test to see if JAVA_HOME is set


# Copy files from conf directories to their prospective build dirs
cp ${ADC_HOME}/conf/hadoop/* ${ADC_HADOOP}/conf/.
cp ${ADC_HOME}/conf/zookeeper/* ${ADC_ZOOKEEPER}/conf/.
cp ${ADC_HOME}/conf/accumulo/* ${ADC_ACCUMULO}/conf/.

#################################################
# sed script the new values into the config files
#################################################
# hadoop_env.sh
# XX_JAVA_HOME_XX
echo "ADC_HOME = " $ADC_HOME
sed 's|XX_JAVA_HOME_XX|'"${JAVA_HOME}"'|g' $ADC_HOME/conf/hadoop/hadoop-env.sh > $ADC_HADOOP/conf/hadoop_env.sh 

# hdfs-site.xml
# XX_HADOOP_NAME_XX
# XX_HADOOP_DATA_XX


# mapred-site.xml
# XX_MAPRED_LOCAL_XX
#

# zoo.cfg
# XX_ZOOKEEPER_DATA_XX
#


