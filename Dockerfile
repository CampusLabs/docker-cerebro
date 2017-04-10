FROM openjdk:8-jre

ENV CEREBRO_VERSION 0.6.5
RUN mkdir /usr/local/lib/cerebro && \
    curl -L https://github.com/lmenezes/cerebro/releases/download/v$CEREBRO_VERSION/cerebro-$CEREBRO_VERSION.tgz | \
      tar xz -C /usr/local/lib/cerebro/ --strip-components 1 && \
    ln -s /usr/local/lib/cerebro/bin/cerebro /usr/local/bin/

WORKDIR /code

COPY bin /code/bin

ENV ELASTICSEARCH_URL http://elasticsearch:9200

EXPOSE 9000

CMD ["bin/run"]
