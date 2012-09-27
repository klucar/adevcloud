#!/bin/env bash

git submodule init
git submodule update

# just a compilation of the steps outlined in the README.md
     
     cd hadoop-common
     ant binary
     tar xvf ./build/hadoop-0.20.203.1-SNAPSHOT-bin.tar.gz -C ../.
     cd ..
     cd zookeeper
     ant binary
     tar xvf ./build/zookeeper-3.3.6-bin.tar.gz -C ../.
     cd ..
     cd accumulo
     mvn package && mvn assembly:single -N
     tar xvf target/accumulo-1.4.1-dist.tar.gz -C ../.
     cd ..



