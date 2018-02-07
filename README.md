Docker Kafka Zookeeper
======================
Docker image for Kafka message broker including Zookeeper

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
bin/kafka-console-consumer.sh --bootstrap-server <YOUR_HOST>:9092 --topic test
```

Run Kafka console producer (ssh)
```
bin/kafka-console-producer --broker-list <YOUR_HOST>:9092 --topic test
test1
test2
test3
```

Verify messages been received in console consumer
```
test1
test2
test3
```

Credits
-------
Originally cloned and inspired by https://github.com/spotify/docker-kafka
