# Scoring image
FROM ubuntu:20.04 AS builder

# Variables
ENV CRAWL_REPO="https://github.com/crawl/scoring.git" \
  APP_DEPS="python3-minimal python3-pip python3-yaml python-is-python3 mysql-server" \
  DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${APP_DEPS}

# Install python packages
RUN pip3 install tornado mako PyYAML mysqlclient

# Retrieve crawl scoring
RUN git clone ${CRAWL_REPO} /scoring/

# Copy over custom configs
COPY settings/sources.yml /scoring/sources.yml

# Clean up unnecessary package lists
RUN rm -rf /var/lib/apt/lists/*

# Set the WORKDIR
WORKDIR /scoring

# Launch scoring process
ENTRYPOINT [ "./scbootstrap.py" ]