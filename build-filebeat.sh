#!/bin/bash
set -euo pipefail

docker build -t docker-filebeat -f filebeat.Dockerfile .
