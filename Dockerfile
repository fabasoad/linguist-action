FROM ruby:2.7.0-buster

RUN apt-get update ;\
    apt-get install -y --no-install-recommends cmake=3.13.4-1 pkg-config=0.29-6 libicu-dev=63.1-6 zlib1g-dev=1:1.2.11.dfsg-1 libcurl4-openssl-dev=7.64.0-4+deb10u1 libssl-dev=1.1.1d-0+deb10u2 ruby-dev=1:2.5.1 ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist -v 7.8.0

COPY linguist.rb /linguist.rb
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]