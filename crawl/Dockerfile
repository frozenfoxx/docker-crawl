# Builder image
FROM ubuntu:20.04 AS builder

# Variables
ENV CRAWL_REPO="https://github.com/crawl/crawl.git" \
  APP_DEPS="bzip2 liblua5.1-0-dev python3-minimal python3-pip python3-yaml \
    python-is-python3 ncurses-term locales-all sqlite3 libpcre3 locales \
    lsof sudo libbot-basicbot-perl cifs-utils keyutils" \
  BUILD_DEPS="autoconf bison build-essential flex git libncursesw5-dev \
    libsqlite3-dev libz-dev pkg-config binutils-gold libsdl2-image-dev libsdl2-mixer-dev \
    libsdl2-dev libfreetype6-dev libpng-dev ttf-dejavu-core advancecomp pngcrush cifs-utils keyutils" \
  DEBIAN_FRONTEND=noninteractive

# Install packages for the build
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${BUILD_DEPS} ${APP_DEPS}

# Retrieve crawl
RUN git clone ${CRAWL_REPO} /src/

# Build crawl
RUN cd /src/crawl-ref/source && \
  make install -j4 DESTDIR=/app/ USE_DGAMELAUNCH=y WEBTILES=y

# Set up webserver components
RUN cp -r /src/crawl-ref/source/webserver /app/ && \
  cp -r /src/crawl-ref/source/util /app/

# Runtime image
FROM ubuntu:20.04

# Environment Variables
ENV APP_DEPS="bzip2 liblua5.1-0-dev python3-minimal python3-pip python3-yaml \
    python-is-python3 ncurses-term locales-all sqlite3 libpcre3 locales \
    lsof sudo libbot-basicbot-perl cifs-utils keyutils" \
  DATA_DIR=/data \
  DEBIAN_FRONTEND=noninteractive

# Install packages for the runtime
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${APP_DEPS}

# Install Tornado
RUN pip3 install tornado

# Copy over the compiled files
COPY --from=builder /app/ /app/

# Copy over custom configs
COPY settings/init.txt /app/settings/
COPY util/webtiles-init-player.sh /app/util/
COPY webserver/config.py /app/webserver/
COPY webserver/games.d/* /app/webserver/games.d/

# Copy over the entrypoint
COPY scripts/entrypoint-webtiles.sh /app/entrypoint.sh

# Clean up unnecessary package lists
RUN rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 8080

# Set the WORKDIR
WORKDIR /app

# Launch WebTiles server
ENTRYPOINT [ "./entrypoint.sh" ]