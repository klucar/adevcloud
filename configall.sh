#!/bin/env bash

# Setup script for all the config files that need non-default settings

# figure out the install directory
ADC_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADC_HADOOP=$ADC_HOME/hadoop-0.20.203.1-SNAPSHOT
ADC_ZOOKEEPER=$ADC_HOME/zookeeper-3.3.6
ADC_ACCUMULO=$ADC_HOME/accumulo-1.4.1

# Test to see if JAVA_HOME is set
if [ -z "$JAVA_HOME" ]; then 
  echo JAVA_HOME is not set
  echo Please set JAVA_HOME and re-run this script
fi

# Copy files from conf directories to their prospective build dirs
cp $ADC_HOME/conf/hadoop/* $ADC_HADOOP/conf/.
cp $ADC_HOME/conf/zookeeper/* $ADC_ZOOKEEPER/conf/.
cp $ADC_HOME/conf/accumulo/* $ADC_ACCUMULO/conf/.

#################################################
# sed script the new values into the config files
#################################################
# hadoop_env.sh
# XX_JAVA_HOME_XX
#echo "ADC_HOME = " $ADC_HOME
#echo "ADC_HADOOP = " $ADC_HADOOP
sed 's|XX_JAVA_HOME_XX|'$JAVA_HOME'|g' $ADC_HOME/conf/hadoop/hadoop-env.sh > $ADC_HADOOP/conf/hadoop-env.sh 

# Prompts user for a directory name
# Tests and/or creates directory if necessary
# $1 is variable name to set as return value
# $2 is prompt text
# $3 is default directory
function prompt_dir {
    echo $2 ": "
    echo -n "(" $3 ") > "
    read INDIR
    if [ -z "$INDIR" ] || [ "{$INDIR+xxx}" = "xxx" ]; then
        INDIR=$3
    fi
    mkdir -p $INDIR
    eval "$1='$INDIR'"
}

# hdfs-site.xml
# XX_HADOOP_NAME_XX
#
HADOOP_NAME=''
prompt_dir HADOOP_NAME "Hadoop Namenode Data Location" "$ADC_HOME/data/hadoop/nn"
sed 's|XX_HADOOP_NAME_XX|'$HADOOP_NAME'|g' $ADC_HOME/conf/hadoop/hdfs-site.xml > $ADC_HOME/conf/hadoop/hdfs-site-tmp.xml 

# XX_HADOOP_DATA_XX
#
HADOOP_DATA=''
prompt_dir HADOOP_DATA "Hadoop Datanode Data Location" "$ADC_HOME/data/hadoop/dn"
sed 's|XX_HADOOP_DATA_XX|'$HADOOP_DATA'|g' $ADC_HOME/conf/hadoop/hdfs-site-tmp.xml > $ADC_HADOOP/conf/hdfs-site.xml
rm $ADC_HOME/conf/hadoop/hdfs-site-tmp.xml

# mapred-site.xml
# XX_MAPRED_LOCAL_XX
#
MAPRED_DATA=''
prompt_dir MAPRED_DATA "Map/Reduce Data Location" "$ADC_HOME/data/hadoop/mr"
sed 's|XX_MAPRED_LOCAL_XX|'$MAPRED_DATA'|g' $ADC_HOME/conf/hadoop/mapred-site.xml > $ADC_HADOOP/conf/mapred-site.xml

# zoo.cfg
# XX_ZOOKEEPER_DATA_XX
#
ZOO_DATA=''
prompt_dir ZOO_DATA "Zookeeper Data Location" "$ADC_HOME/data/zookeeper"
sed 's|XX_ZOOKEEPER_DATA_XX|'$ZOO_DATA'|g' $ADC_HOME/conf/zookeeper/zoo.cfg > $ADC_ZOOKEEPER/conf/zoo.cfg 


