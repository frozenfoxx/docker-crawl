# Base image
FROM ubuntu:20.04

# Variables
ENV CRAWL_REPO="https://github.com/crawl/crawl.git" \
  APP_DEPS="bzip2 liblua5.1-0-dev python3-minimal python3-pip python3-yaml \
    python-is-python3 ncurses-term locales-all sqlite3 libpcre3 locales \
    lsof sudo libbot-basicbot-perl" \
  BUILD_DEPS="autoconf bison build-essential flex git libncursesw5-dev \
    libsqlite3-dev libz-dev pkg-config binutils-gold libsdl2-image-dev libsdl2-mixer-dev \
    libsdl2-dev libfreetype6-dev libpng-dev ttf-dejavu-core advancecomp pngcrush" \
  DEBIAN_FRONTEND=noninteractive

# Logic
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${BUILD_DEPS} ${APP_DEPS}

# Install Tornado
RUN pip3 install tornado

# Retrieve crawl
RUN git clone ${CRAWL_REPO} /src/

# Build crawl
RUN cd /src/crawl-ref/source && \
  make -j4 USE_DGAMELAUNCH=y WEBTILES=y

# Make directory for RCs
RUN mkdir -p /src/crawl-ref/source/rcs

# Clean up unnecessary packages
RUN apt-get remove -y ${BUILD_DEPS} && \
  apt-get autoremove --purge -y && \
  rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 8080

# Set the WORKDIR
WORKDIR /src/crawl-ref/source

# Launch WebTiles server
CMD [ "./webserver/server.py" ]