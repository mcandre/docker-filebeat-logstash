FROM library/golang:1.8
RUN apt-get update && \
    apt-get install -y \
        libpcap-dev \
        libsasl2-dev && \
    go get github.com/elastic/beats/...; which filebeat && \
    mkdir -p /logz
COPY filebeat.yml /filebeat.yml
EXPOSE 6060
ENTRYPOINT ["/go/bin/filebeat", "-c", "/filebeat.yml", "-httpprof", ":6060", "-e", "-d", "'*'"]
