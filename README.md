# docker-filebeat-logstash: dummy filebeat/logstash configs

# EXAMPLE

Launch filebeat and logstash with docker-compose:

```console
$ docker-compose rm -f; docker-compose up
...
```

Supply sample logs to filebeat:

```console
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
cf5e593694ed        docker-filebeat     "/go/bin/filebeat ..."   5 seconds ago       Up 4 seconds                                 dockercomposefilebeat_filebeat_1
82d2c2bbe5bb        docker-logstash     "/usr/share/logsta..."   6 seconds ago       Up 5 seconds        0.0.0.0:5044->5044/tcp   dockercomposefilebeat_logstash_1

$ docker exec cf5e593694ed sh -c 'echo "somedata" >> /logz/somefile.log'
```

Back in docker-compose, we see the log propogate through filebeat to logstash:

```console
filebeat_1  | 2017/06/29 16:35:51.137500 harvester.go:201: INFO Harvester started for file: /logz/somefile.log
logstash_1  | 2017-06-29T16:35:51.138Z cf5e593694ed somedata
```

# REQUIREMENTS

* [Docker](https://www.docker.com)

# BUILD DOCKER IMAGES

```console
$ sh build-filebeat.sh
$ sh build-logstash.sh
```
