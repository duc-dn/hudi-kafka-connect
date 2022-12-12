---
- Tạo hudi-control-topic cho việc điều phối các transactions
```
docker exec broker kafka-topics --delete --topic hudi-control-topic --bootstrap-server broker:9092
docker exec broker kafka-topics --create --topic hudi-control-topic --partitions 1 --replication-factor 1 --bootstrap-server broker:9092
```
---
- Send dummy data tới topic hudi-test-topic (dùng kafkacat)
```
cd producer
bash setupKafka.sh -n <total_kafka_messages> -b <num_batches>
```
- Trong file setupKafka.sh, sẽ tự tạo topic hudi-test-topic, và gửi schema tới schema registry
---
### Chạy Sink connector worker (multiple workers can be run)
```
docker exec broker connect-distributed /kafka-config/connect-distributed.properties
```
- Thêm hudi-sink vào connector
```
docker exec broker curl -X DELETE http://localhost:8083/connectors/hudi-sink
docker exec broker curl -X POST -H "Content-Type:application/json" -d @/kafka-config/config-sink.json http://localhost:8083/connectors
```
