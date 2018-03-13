apt-get update && \
    apt-get install -y wget supervisor && \
    apt-get install wget -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get install vim -y && \

#install java
apt-get update
apt-get install openjdk-8-jre

#update-alternatives --config java
echo java -version

#note that default broker.id = 0
export ZOOKEEPER_VERSION=3.4.11
export SCALA_VERSION=2.12
export KAFKA_VERSION=1.0.0
export KAFKA_HOME=/opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"
export KAFKA_DOWNLOAD_URL=https://archive.apache.org/dist/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

wget -q $KAFKA_DOWNLOAD_URL -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz
tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

# Run Kafka
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties