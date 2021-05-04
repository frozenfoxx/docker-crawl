# Scoring image
FROM ubuntu:20.04

# Variables
ENV CRAWL_REPO="https://github.com/crawl/scoring.git" \
  APP_DEPS="python python2-minimal nginx mysql-server libmysqlclient-dev git" \
  DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${APP_DEPS}

# Install python packages
RUN pip install mako PyYAML mysqlclient

# Retrieve crawl scoring
RUN git clone ${CRAWL_REPO} /scoring/

# Copy over custom configs
COPY settings/sources.yml /scoring/sources.yml
COPY settings/nginx.conf /etc/nginx/sites-enabled/crawl.conf
COPY settings/initScoringDb.sql /scoring/initScoringDb.sql

# RUN mysql -h localhost 

# Clean up unnecessary package lists
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 80

# Set the WORKDIR
WORKDIR /scoring

CMD ["nginx", "-g", "daemon off;"]
