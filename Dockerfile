FROM openjdk:8-jre

ENV CONTAINERPILOT_VERSION 2.7.0
RUN curl -L https://github.com/joyent/containerpilot/releases/download/$CONTAINERPILOT_VERSION/containerpilot-$CONTAINERPILOT_VERSION.tar.gz | \
      tar xz -C /usr/local/bin/

ENV CEREBRO_VERSION 0.5.0
RUN mkdir /usr/local/lib/cerebro && \
    curl -L https://github.com/lmenezes/cerebro/releases/download/v$CEREBRO_VERSION/cerebro-$CEREBRO_VERSION.tgz | \
      tar xz -C /usr/local/lib/cerebro/ --strip-components 1 && \
    ln -s /usr/local/lib/cerebro/bin/cerebro /usr/local/bin/

WORKDIR /code

COPY bin /code/bin
COPY etc /code/etc

ENV CONSUL_URL http://consul:8500
ENV ELASTICSEARCH_URL http://elasticsearch:9200

EXPOSE 9000

CMD ["bin/run"]
