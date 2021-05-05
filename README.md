# docker-crawl

[![Crawl-build-and-push](https://github.com/dkirby-ms/docker-crawl/actions/workflows/crawl-build.yml/badge.svg)](https://github.com/dkirby-ms/docker-crawl/actions/workflows/crawl-build.yml)
[![Scoring-build-and-push](https://github.com/dkirby-ms/docker-crawl/actions/workflows/scoring-build.yml/badge.svg)](https://github.com/dkirby-ms/docker-crawl/actions/workflows/scoring-build.yml)

Docker container and Kubernetes manifests for Dungeon Crawl Stone Soup (DCSS), crawl-scoring, and eventually beem.

Forked from: [frozenfoxx/docker-crawl](https://github.com/frozenfoxx/docker-crawl)

## Setup

## Deploy

## Persistence

All player RCs and webserver database files are located within `/data` within the container. Bind mount a host directory or use a persistent volume claim to maintain persistence.
