# docker-crawl

[![Crawl-build-and-push](https://github.com/dkirby-ms/docker-crawl/actions/workflows/crawl-build.yml/badge.svg)](https://github.com/dkirby-ms/docker-crawl/actions/workflows/crawl-build.yml)
[![Scoring-build-and-push](https://github.com/dkirby-ms/docker-crawl/actions/workflows/scoring-build.yml/badge.svg)](https://github.com/dkirby-ms/docker-crawl/actions/workflows/scoring-build.yml)

Docker container and Kubernetes manifests for Dungeon Crawl Stone Soup (DCSS), crawl-scoring, and eventually beem.

Forked from: [frozenfoxx/docker-crawl](https://github.com/frozenfoxx/docker-crawl)

## Setup

* Configure webserver by editing ./crawl/webserver/config.py with your values. Note that trunk is configured here under the games OrderedDict
* Configure additional games (e.g., sprint, tutorial, zot, stable versions) by editing ./crawl/webserver/games.d/base.yaml
  * Note that stable versions are not currently building with the current docker-crawl image. If you want to run stable versions, you will need to either create new images or add them to the current docker-crawl image.
* Configure scoring:
  * Edit ./scoring/settings/nginx.conf and provide your server URL
  * Edit ./scoring/settings/sources.yml and provide your server URL and adjust paths to logfiles/milestones if needed
  * Edit ./scoring/settings/toplink.mako and provide your server URL
  * Edit ./scoring/settings/index.mako and provide your server URL

## Deploy

* All player RCs and webserver database files are located within `/data` within the container. Bind mount a host directory or use a persistent volume claim to maintain persistence. Included manifests use Azure Files for persistence but you can adjust and use whatever makes sense for your environment.
* kubectl apply -f manifests/
