FROM library/logstash
COPY logstash.conf /logstash.conf
EXPOSE 9600
ENTRYPOINT ["/usr/share/logstash/bin/logstash", "-f", "/logstash.conf"]
