FROM confluentinc/cp-kafka-connect:6.0.0

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:1.2.2 \
&& confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:5.5.2 \
&& confluent-hub install --no-prompt confluentinc/kafka-connect-s3:5.5.2 \
&& confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:10.0.1 \
&& confluent-hub install --no-prompt confluentinc/kafka-connect-aws-cloudwatch-metrics:1.1.2 \
&& confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:1.2.2


