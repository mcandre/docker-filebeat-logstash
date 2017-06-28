FROM library/golang:1.8
RUN apt-get update && \
    apt-get install -y \
        libpcap-dev \
        libsasl2-dev && \
    go get github.com/elastic/beats/...; echo 0
COPY filebeat.yml /filebeat.yml
EXPOSE 5044
ENTRYPOINT ["/go/binfilebeat", "-c", "/filebeat.yml", "-e", "-d", "'*'"]
