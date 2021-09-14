# zbroker

An image that combines Confluent kafka and zookeeper images, and makes
the broker connect to the local zookeeper. Intended to be used for
minor test cases.

Builds on confluentinc/cp-kafka and adds startup scripts for the
zookeeper which is, in fact, included in the first package.

Not tested at all at the moment.

## Build

```shell
docker build -t zbroker ./
```

## Run

```shell
docker run -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 zbroker
```
