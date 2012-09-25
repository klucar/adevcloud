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

##Get the repo, setup submodules 

     git clone https://github.com/klucar/adevcloud.git
     cd adevcloud
     git submodule init
     git submodule update

_now go get a cup of coffee or tea or redbull..._

##Compile everything

_These are the commands in the 'buildall.sh' script. You can run that and walk away for a while if you 
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



