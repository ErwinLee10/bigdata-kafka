### prerequisite
1. register twitter developer account to get the access key

### Installation
1. clone this project
 
   
   
```
$ git clone git@github.com:ErwinLee10/bigdata-kafka.git
```

2. **open a new terminal** and run the zookeper
```sh
$ cd bigdata-kafka/setup
$ ../bin/zookeeper-server-start.sh ../config/zookeeper.properties
```

3. **open a new terminal** and run the kafka broker
```sh
$ cd bigdata-kafka/setup
$ ../bin/kafka-server-start.sh ../config/server.properties
```

4. **open a new terminal** and run the kafka connect cluster
```sh
$ cd bigdata-kafka/setup
$ .../bin/connect-distributed.sh ../config/connect-distributed.properties 
```
5. **open a new terminal** and submit the kafka connect twitter source jobs
```sh
curl -X POST \
  localhost:8084/connectors \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{
  "name": "twitter-connector",
  "config": {
    "tasks.max": "1",
    "connector.class": "com.github.jcustenborder.kafka.connect.twitter.TwitterSourceConnector",
    "process.deletes": "false",
    "filter.keywords": "Indonesia,Singapore,India,Taiwan,China,Covid-19,bitcoin",
    "kafka.status.topic": "twitter.raw",
    "twitter.oauth.accessTokenSecret": "TO BE FILLED",
    "twitter.oauth.accessToken": "TO BE FILLED",
    "twitter.oauth.consumerKey": "TO BE FILLED",
    "twitter.oauth.consumerSecret": "TO BE FILLED"
  }
}'
```

6. to check whether the setup is correct, try to consume the message by running this command:
```
$ cd bigdata-kafka/setup
$ ../bin/kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic twitter.raw
```

------------------------------------------------

#### setting up HDFS sink connector
1. install hadoop locally
```
https://medium.com/beeranddiapers/installing-hadoop-on-mac-a9a3649dbc4d
```
```
or can follow the guide from the lecturer.
```

2. submit the below configuration to kafka connect
```
curl -X POST \
  localhost:8084/connectors \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{
  "name": "HdfsSinkConnector",
  "config": {
    "connector.class": "io.confluent.connect.hdfs.HdfsSinkConnector",
    "flush.size": "1",
    "topics": "THE TOPIC NAME",
    "tasks.max": "1",
    "hdfs.url": "hdfs://localhost:8020",
    "format.class": "io.confluent.connect.hdfs.json.JsonFormat",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "key.converter": "org.apache.kafka.connect.storage.StringConverter"
  }
}'
```

3. check your HDFS, there will be /topics and /logs created in your hdfs if the above setup works.
```
hdfs dfs -ls /
```

4. the data from kafka is stored in the /topics folder

