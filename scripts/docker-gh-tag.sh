#!/usr/bin/env bash
export DOCKER_TAG=${GITHUB_REF#refs/tags/}

git checkout . && \
    docker build . -t ghcr.io/hostcc/prest:latest && \
    docker tag ghcr.io/hostcc/prest:latest ghcr.io/hostcc/prest:v1 && \
    docker tag ghcr.io/hostcc/prest:latest ghcr.io/hostcc/prest:$DOCKER_TAG && \
    docker push ghcr.io/hostcc/prest:latest && \
    docker push ghcr.io/hostcc/prest:v1 && \
    docker push ghcr.io/hostcc/prest:$DOCKER_TAG
