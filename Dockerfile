# Base image
FROM ubuntu:18.04

# Variables
ENV CRAWL_REPO=https://github.com/crawl/crawl.git \
  BUILD_DEPS="autoconf bison build-essential flex git" \
  APP_DEPS="bzip2 python-minimal ncurses-term locales-all sqlite3 libpcre3 liblua5.1-0 locales lsof libncursesw5-dev libsqlite3-dev sudo libbot-basicbot-perl"

# Logic
RUN apt update && \
  upgrade -y && \
  install -y ${BUILD_DEPS} ${APP_DEPS}

RUN pip3 install tornado

RUN git clone ${CRAWL_REPO} /src/
