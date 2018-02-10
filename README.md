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
Run Kafka console consumer (ssh)
```
bin/kafka-console-consumer --bootstrap-server <YOUR_HOST>:9092 --topic test
```

Run Kafka console producer (ssh)
```
bin/kafka-console-producer --broker-list <YOUR_HOST>:9092 --topic test
banana!
```

Verify messages been received in console consumer
```
banana!
```

Credits
-------
Originally cloned and inspired by https://github.com/spotify/docker-kafka
