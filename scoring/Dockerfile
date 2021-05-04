# Scoring image
FROM ubuntu:20.04

# Variables
ENV CRAWL_REPO="https://github.com/crawl/scoring.git" \
  APP_DEPS="curl python python2-minimal nginx mysql-server libmysqlclient-dev git software-properties-common" \
  DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ${APP_DEPS} && \
  add-apt-repository universe && \
  apt-get update

# Install pip for python2
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && \
    chmod 700 get-pip.py && \
    python2 get-pip.py

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

# Set permissions on executables
RUN chmod 700 /scoring/scoresd.py && \
    chmod 700 /scoring/scbootstrap.py

EXPOSE 80

# Set the WORKDIR
WORKDIR /scoring

CMD ["nginx", "-g", "daemon off;"]
