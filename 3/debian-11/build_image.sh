#!/bin/bash
docker context use default
docker buildx build --platform linux/amd64 -t nbembedded/opencart:latest --push .