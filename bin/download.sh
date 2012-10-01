#!/bin/env bash

# get script bin directory
ADC_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ADC_HOME=$ADC_HOME/..

mkdir $ADC_HOME/download
cd $ADC_HOME/download 
# Download tarballs from a mirror
wget http://download.nextag.com/apache/hadoop/common/hadoop-0.20.205.0/hadoop-0.20.205.0.tar.gz 

wget http://download.nextag.com/apache/zookeeper/zookeeper-3.3.5/zookeeper-3.3.5.tar.gz 

wget http://download.nextag.com/apache/accumulo/1.4.1/accumulo-1.4.1-dist.tar.gz 

# Expand the tarballs
mkdir $ADC_HOME/deploy
tar xf hadoop-0.20.205.0.tar.gz -C $ADC_HOME/deploy/.
tar xf zookeeper-3.3.5.tar.gz -C $ADC_HOME/deploy/.
tar xf accumulo-1.4.1-dist.tar.gz -C $ADC_HOME/deploy/.


