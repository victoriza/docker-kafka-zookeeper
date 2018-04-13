apt-get update && \
    apt-get install -y wget supervisor && \
    apt-get install wget -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get install vim -y && \
    apt-get install git -y && \
    apt-get install openjdk-8-jre -y && \
    apt-get clean && \

#get the repo
cd /home
git clone https://github.com/victoriza/docker-kafka-zookeeper.git
cd /home/docker-kafka-zookeeper

# Kafka script
cp assets/scripts/start-kafka.sh /usr/bin/start-kafka.sh

# ZK script
cp assets/scripts/start-zookeeper.sh /usr/bin/start-zookeeper.sh

# Supervisor config
cp assets/supervisor/kafka.conf /etc/supervisor/conf.d/
cp assets/supervisor/zookeeper.conf /etc/supervisor/conf.d/

# ZK config
cp assets/conf/zoo.cfg $ZOOKEEPER_HOME/conf

# Start supervisor
supervisord -n
