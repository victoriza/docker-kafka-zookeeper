#!/bin/sh
export ZOOKEEPER_VERSION=3.4.11
export ZOOKEEPER_HOME=/opt/zookeeper-"$ZOOKEEPER_VERSION"

wget -q http://ftp.cixug.es/apache/zookeeper/zookeeper-"$ZOOKEEPER_VERSION"/zookeeper-"$ZOOKEEPER_VERSION".tar.gz -O /tmp/zookeeper-"$ZOOKEEPER_VERSION".tgz
ls -l /tmp/zookeeper-"$ZOOKEEPER_VERSION".tgz
tar xfz /tmp/zookeeper-"$ZOOKEEPER_VERSION".tgz -C /opt && rm /tmp/zookeeper-"$ZOOKEEPER_VERSION".tgz

#remember to copy the zoo.conf
$ZOOKEEPER_HOME/bin/zkServer.sh start-foreground