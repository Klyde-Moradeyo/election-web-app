# Stage 1: Build Stage
FROM ruby:3.0.3 as Builder

# Install Yarn and Node.js
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn mariadb-client postgresql sqlite3 vim --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Installing gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.5.7 && \
    bundle config --global frozen 1 && \
    bundle install --without test

# Copying the app files and precompile assets
COPY . .
RUN rails assets:precompile --trace

# Stage 2: Runtime Stage
FROM ruby:3.0.3
ENV PORT=80 \
    RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    RAILS_SERVE_STATIC_FILES=true

EXPOSE 80

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y libpq5 nodejs --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Copy app with precompiled assets and bundle from the Builder stage
COPY --from=Builder /usr/src/app /usr/src/app
COPY --from=Builder /usr/local/bundle /usr/local/bundle

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]
