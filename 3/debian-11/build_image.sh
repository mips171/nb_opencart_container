#!/bin/bash
docker context use default
docker system prune -f
docker buildx build --platform linux/amd64 --build-arg CACHEBUST="$(date +%s)" -t nbembedded/opencart:latest --push .