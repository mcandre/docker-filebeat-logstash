FROM library/logstash
COPY logstash.conf /logstash.conf
EXPOSE 5044
ENTRYPOINT ["/usr/share/logstash/bin/logstash", "-f", "/logstash.conf"]
