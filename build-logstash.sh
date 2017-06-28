#!/bin/bash
set -euo pipefail

docker build -t logstash -f logstash.Dockerfile .
