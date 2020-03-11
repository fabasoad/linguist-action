FROM ruby:2.7.0-buster

RUN apt-get update ;\
    apt-get install -y --no-install-recommends cmake=3.10.2 pkg-config=0.29.2 libicu-dev=60.2-3ubuntu3 zlib1g-dev=1:1.2.11.dfsg-0ubuntu2 libcurl4-openssl-dev=7.58.0-2ubuntu3.8 libssl-dev=1.1.1-1ubuntu2.1~18.04.5 ruby-dev=1:2.5.1 ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist -v 7.8.0

COPY linguist.rb /linguist.rb
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]