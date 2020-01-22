FROM ruby:2.6.3
# install bundler.
RUN apt-get update && \
    apt-get install -y vim less postgresql-client && \
    apt-get install -y build-essential libpq-dev nodejs && \
    gem install bundler && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ENV EDITOR vim

RUN bundle config --global retry 5 \
  && bundle config --global jobs 4 \
  && bundle config --global path vendor/bundle

RUN bundle install