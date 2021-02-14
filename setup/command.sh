../bin/zookeeper-server-start.sh ../config/zookeeper.properties
../bin/kafka-server-start.sh ../config/server.properties
../bin/connect-distributed.sh ../config/connect-distributed.properties 
##docker run --rm -it -p 8000:8000 -e "CONNECT_URL=http://docker.for.mac.localhost:8084" landoop/kafka-connect-ui
