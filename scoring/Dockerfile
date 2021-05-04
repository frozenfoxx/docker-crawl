# Scoring image
FROM nginx:latest

# Variables
ENV CRAWL_REPO="https://github.com/crawl/scoring.git" \
  APP_DEPS="python3-minimal python3-pip python3-yaml python-is-python3 mysql-server libmysqlclient-dev git" \
  DEBIAN_FRONTEND=noninteractive

# Install packages
# RUN apt-get update && \
#   apt-get upgrade -y && \
#   apt-get install -y ${APP_DEPS}
RUN apk update && \
    apk update && \
    apk add ${APP_DEPS}


# Install python packages
RUN pip3 install mako PyYAML mysqlclient

# Retrieve crawl scoring
RUN git clone ${CRAWL_REPO} /scoring/

# Copy over custom configs
COPY settings/sources.yml /scoring/sources.yml

# Clean up unnecessary package lists
RUN rm -rf /var/lib/apt/lists/*

# Set the WORKDIR
WORKDIR /scoring
