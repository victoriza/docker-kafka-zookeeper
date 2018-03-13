Docker Kafka Zookeeper
======================
This repository provides everything you need to run Kafka in Docker.

Why?
---
The main hurdle of running Kafka in Docker is that it depends on Zookeeper.
Compared to other Kafka docker images, this one runs both Zookeeper and Kafka
in the same container. This means:

* No dependency on an external Zookeeper host, or linking to another container
* Zookeeper and Kafka are configured to work together out of the box

Build
-------------
```
docker build -t kafka-zookeeper:latest .
```


Run container
-------------
```
docker run -p 2181:2181 -p 9092:9092 -e ADVERTISED_HOST=<YOUR_HOST> kafka-zookeeper:latest
```

Test
----
Create topic
```
kafka-topics --create --zookeeper <YOUR_HOST>:2181 --replication-factor 1 --partitions 1 --topic test
```

Run Kafka console consumer (ssh)
```
bin/kafka-console-consumer --bootstrap-server <YOUR_HOST>:9092 --topic test
```

Run Kafka console producer (ssh)
```
bin/kafka-console-producer --broker-list <YOUR_HOST>:9092 --topic test
banana0!
```

Verify messages been received in console consumer
```
banana0!
```

Clusterize it
=============
If you want to clusterize it (for testing purposes) use the standalone scripts and modify server.properties for each additional broker.
See examples below:
config/server-1.properties:
    broker.id=1
    listeners=PLAINTEXT://:9093
    log.dir=/tmp/kafka-logs-1
 
config/server-2.properties:
    broker.id=2
    listeners=PLAINTEXT://:9094
    log.dir=/tmp/kafka-logs-2

NOTE: If they are not running on the same machine, mind the public / private IP

Credits
-------
Originally cloned and inspired by https://github.com/spotify/docker-kafka
