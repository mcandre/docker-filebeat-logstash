#!/bin/bash
set -euo pipefail

docker build -t filebeat -f filebeat.Dockerfile .
