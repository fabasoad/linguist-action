FROM ruby:3.0.0-buster

RUN apt-get update && apt-get install -y --no-install-recommends cmake=3.13.4-1 ruby-dev=1:2.5.1 ;\
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v 2.2.4

COPY Gemfile /Gemfile
RUN bundle install
RUN cat Gemfile.lock

COPY linguist.rb /linguist.rb
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]