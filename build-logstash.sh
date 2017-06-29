#!/bin/bash
set -euo pipefail

docker build -t docker-logstash -f logstash.Dockerfile .
