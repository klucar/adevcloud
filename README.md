adevcloud
=========
A fast way to get Accumulo up and running on your local machine.

It uses git submodules to track the necessary repos/branches from github:
* accumulo (1.4.1)
* hadoop-common (release-0.20.203.0)
* zookeeper (release-3.3.6)

# How-To
##Prerequisites
* working Java installation
* ant
* maven2
* password-less ssh setup

##Get the repo, setup submodules 

     git clone https://github.com/klucar/adevcloud.git
     cd adevcloud
     git submodule init
     git submodule update

_now go get a cup of coffee or tea or redbull..._

##Compile everything

_These are the commands in the `buildall.sh` script. You can run that and walk away for a while if you 
don't want to step through and wait for each build._

### Hadoop

     cd hadoop-common
     ant binary
     tar xvf ./build/hadoop-0.20.203.1-SNAPSHOT-bin.tar.gz -C ../.
     cd ..

### Zookeeper
    
     cd zookeeper
     ant binary
     tar xvf ./build/zookeeper-3.3.6-bin.tar.gz -C ../.
     cd ..

### Accumulo

     cd accumulo
     mvn package && mvn assembly:single -N
     tar xvf target/accumulo-1.4.1-dist.tar.gz -C ../.
     cd ..

## Set config files
The _configall.sh_ script will prompt for directories where you want various files stored on the local filesystem. It then adds the appropriate values and copies config files where they need to go. Just pressing Enter will accept the default values.

     $ ./configall.sh 
          Hadoop Namenode Data Location : 
          ( /foo/bar/adevcloud/data/hadoop/nn ) > 
          Hadoop Datanode Data Location : 
          ( /foo/bar/adevcloud/data/hadoop/dn ) > 
          Map/Reduce Data Location : 
          ( /foo/bar/adevcloud/data/hadoop/mr ) > 
          Zookeeper Data Location : 
          ( /foo/bar/adevcloud/data/zookeeper ) > 

__This script also set the appropriate environment variables in your .bashrc file__

## Init Hadoop
_From a new terminal_
     
     $ /foo/bar/adevcloud/hadoop-0.20.203.1-SNAPSHOT/bin/namenode format

## Start Hadoop, Zookeeper
     $ /foo/bar/adevcloud/hadoop-0.20.203.1-SNAPSHOT/bin/start-all.sh
     $ /foo/bar/adevcloud/zookeeper-3.3.6/bin/zkServer.sh start

## Init Accumulo
     $ /foo/bar/adevcloud/accumulo-1.4.1/bin/accumulo init

_this will prompt for an instance name and password for the Accumulo root user_

## Start Accumulo
     $ /foo/bar/adevcloud/accumulo-1.4.1/bin/start-all.sh

## Checkout Accumulo
    $ /foo/bar/adevcloud/accumulo-1.4.1/bin/accumulo shell





