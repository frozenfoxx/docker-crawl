# Base image
FROM ubuntu:20.04

# Variables
ENV CRAWL_REPO=https://github.com/crawl/crawl.git \
  BUILD_DEPS="autoconf bison build-essential flex git" \
  APP_DEPS="bzip2 python3-minimal python3-pip ncurses-term locales-all sqlite3 libpcre3 liblua5.1-0 locales lsof libncursesw5-dev libsqlite3-dev sudo libbot-basicbot-perl"

# Logic
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${BUILD_DEPS} ${APP_DEPS}

# Install Tornado
RUN pip3 install tornado

# Retrieve crawl
RUN git clone ${CRAWL_REPO} /src/

# Clean up unnecessary packages
RUN apt-get remove -y ${BUILD_DEPS} && \
  apt-get autoremove --purge -y && \
  rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 8080