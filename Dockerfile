# Base image
FROM ubuntu:18.04

# Variables
ENV CRAWL_REPO=https://github.com/crawl/crawl.git \
  BUILD_DEPS="git"

# Logic
apt update && \
  upgrade -y && \
  install -y ${BUILD_DEPS}

git clone ${CRAWL_REPO} /src/
