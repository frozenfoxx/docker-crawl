# docker-crawl

Docker container for Dungeon Crawl Stone Soup (DCSS).

Docker Hub: [https://hub.docker.com/r/frozenfoxx/crawl](https://hub.docker.com/r/frozenfoxx/crawl)

## How to Build

```
git clone git@github.com:frozenfoxx/docker-crawl.git
cd docker-crawl
docker build .
```

# How to Use this Image

## Quickstart

The following will run the latest Webtiles crawl server.

```
docker run -d --rm -p 8080:8080 --name=crawl_webtiles frozenfoxx/crawl:latest
```