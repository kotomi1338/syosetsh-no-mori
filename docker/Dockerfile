# ==============================================================================
# docker - Dockerfile
# ==============================================================================
# ruby:2.6.5-alpine
FROM ruby@sha256:da560e130d6a4b75b099e932a98331ec3b2420b914d51a88edc4fe3c60aee9b1
ENV LANG C.UTF-8

ENV RAILS_ENV production

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

# Install gems
# COPY vendor/bundle vendor/bundle
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY docker/scripts/bundle_install.sh scripts/bundle_install.sh
COPY docker/scripts/apk_install.sh scripts/apk_install.sh
RUN /bin/sh scripts/apk_install.sh && \
  /bin/sh scripts/bundle_install.sh && \
  apk del alpine-sdk libxml2-dev && \
  rm -rf /usr/local/bundle/cache && \
  bundle clean

# Prepare App
COPY . $APP_HOME

## Expose assets for web container
VOLUME $APP_HOME/public/assets

EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0
