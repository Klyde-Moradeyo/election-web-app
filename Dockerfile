FROM ruby:3.0.3

ENV PORT 80
EXPOSE 80

# Ref: https://www.engineyard.com/blog/using-docker-for-rails
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y nodejs mariadb-client postgresql sqlite3 vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV development
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config --global frozen 1
RUN bundle install --without test

COPY . /usr/src/app

# uncomment this for production
# ENV RAILS_ENV production
# ENV RAILS_SERVE_STATIC_FILES true
# RUN bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]
