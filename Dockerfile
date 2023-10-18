FROM confluentinc/cp-kafka:7.5.1

USER root

ENV COMPONENT=zookeeper
ENV ZOOKEEPER_CLIENT_PORT=2181
ENV KAFKA_ZOOKEEPER_CONNECT=localhost:2181

EXPOSE 2181 2888 3888 9092

RUN mkdir -p /var/lib/${COMPONENT}/data /var/lib/${COMPONENT}/log /etc/${COMPONENT}/secrets \
  && chmod -R ag+w /etc/kafka /var/lib/${COMPONENT}/data /var/lib/${COMPONENT}/log /etc/${COMPONENT}/secrets \
  && chown -R appuser:appuser /var/log/kafka /var/log/confluent /var/lib/kafka /var/lib/zookeeper /etc/${COMPONENT}/secrets \
  && rm -rf /etc/confluent/docker

VOLUME ["/var/lib/${COMPONENT}/data", "/var/lib/${COMPONENT}/log", "/etc/${COMPONENT}/secrets", "/var/lib/kafka/data", "/etc/kafka/secrets"]

COPY --chown=appuser:appuser include/etc/confluent/ /etc/confluent/

USER appuser

CMD ["/etc/confluent/docker/run"]
