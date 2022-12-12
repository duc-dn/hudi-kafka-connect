FROM onfluentinc/cp-kafka

ENV CONFIG /kafka-config
ENV KAFKA_PLUGINS /usr/local/share/kafka/plugins

COPY ./config: ${CONFIG}
COPY ./kafka-plugins: ${KAFKA_PLUGINS}