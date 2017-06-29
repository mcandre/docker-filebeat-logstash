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
38f5cf1a3b1e        docker-filebeat     "/go/bin/filebeat ..."   4 minutes ago       Up 4 minutes        0.0.0.0:6060->6060/tcp   dockerfilebeatlogstash_filebeat_1
e9224d846164        docker-logstash     "/usr/share/logsta..."   4 minutes ago       Up 4 minutes        0.0.0.0:5044->5044/tcp   dockerfilebeatlogstash_logstash_1

$ docker exec 38f5cf1a3b1e sh -c 'echo "somedata" >> /logz/somefile.log'
```

Back in docker-compose, we see the log propogate through filebeat to logstash:

```console
filebeat_1  | 2017/06/29 16:35:51.137500 harvester.go:201: INFO Harvester started for file: /logz/somefile.log
logstash_1  | 2017-06-29T16:35:51.138Z cf5e593694ed somedata
```

We can also request filebeat metrics at a debugging endpoint:

```console
$ curl :6060/debug/vars
{
  "registrar.writes": 2,
  "registrar.states.current": 1,
  "registrar.states.update": 2,
  "registrar.states.cleanup": 0,
  "libbeat.config.reloads": 0,
  "libbeat.config.module.starts": 0,
  "libbeat.config.module.stops": 0,
  "libbeat.config.module.running": 0,
  "beat.memstats.memory_total": 4736024,
  "beat.memstats.memory_alloc": 2805960,
  "beat.memstats.gc_next": 5183136,
  "filebeat.harvester.open_files": 1,
  "filebeat.harvester.skipped": 0,
  "filebeat.harvester.started": 1,
  "filebeat.harvester.closed": 0,
  "filebeat.harvester.running": 1,
  "filebeat.prospector.log.files.renamed": 0,
  "filebeat.prospector.log.files.truncated": 0,
  "output.events.acked": 1,
  "output.write.errors": 0,
  "output.write.bytes": 217,
  "output.elasticsearch.events.acked": 0,
  "output.elasticsearch.events.not_acked": 0,
  "output.elasticsearch.publishEvents.call.count": 0,
  "output.elasticsearch.read.errors": 0,
  "output.elasticsearch.read.bytes": 0,
  "output.elasticsearch.write.bytes": 0,
  "output.elasticsearch.write.errors": 0,
  "output.kafka.events.acked": 0,
  "output.kafka.events.not_acked": 0,
  "output.kafka.publishEvents.call.count": 0,
  "output.logstash.events.acked": 1,
  "output.logstash.events.not_acked": 0,
  "output.logstash.publishEvents.call.count": 1,
  "output.logstash.read.errors": 0,
  "output.logstash.read.bytes": 6,
  "output.logstash.write.bytes": 217,
  "output.logstash.write.errors": 0,
...
```

# REQUIREMENTS

* [Docker](https://www.docker.com)
* [curl](https://curl.haxx.se)

## Optional

* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)

# BUILD DOCKER IMAGES

```console
$ sh build-filebeat.sh
$ sh build-logstash.sh
```
