FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
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
ENV BUNDLE_PATH vendor/bundle

RUN bundle config --global retry 5 \
  && bundle config --global jobs 4 \
  && bundle config --global path vendor/bundle

RUN bundle install

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]