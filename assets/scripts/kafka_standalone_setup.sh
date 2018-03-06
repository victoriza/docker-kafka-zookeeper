apt-get update && \
    apt-get install -y wget supervisor && \
    apt-get install wget -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get install openjdk-8-jre -y && \
    apt-get install vim -y && \
    echo java -version

export ZOOKEEPER_VERSION=3.4.11
export SCALA_VERSION=2.12
export KAFKA_VERSION=1.0.0
export KAFKA_HOME=/opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"
export KAFKA_DOWNLOAD_URL=https://archive.apache.org/dist/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

export ADVERTISED_PORT=

wget -q $KAFKA_DOWNLOAD_URL -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz
tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz

start-kafka.sh