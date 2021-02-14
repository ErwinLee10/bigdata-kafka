kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic first_topic --from-beginning
kafka-server-start.sh config/server.properties
kafka-topics.sh --zookeeper 127.0.0.1:2181 --topic first_topic --describe
kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic first_topic
