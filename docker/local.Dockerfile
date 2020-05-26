# ==============================================================================
# docker - local.Dockerfile
# ==============================================================================
# ruby:2.6.5-alpine
FROM ruby@sha256:da560e130d6a4b75b099e932a98331ec3b2420b914d51a88edc4fe3c60aee9b1
ENV LANG C.UTF-8

ENV APP_HOME /rails_app
WORKDIR $APP_HOME

ENV BUNDLE_BUILD__SASSC --disable-march-tune-native

# Install apk package
COPY docker/scripts/apk_install.sh scripts/apk_install.sh
RUN /bin/sh scripts/apk_install.sh

# Prepare App
COPY . $APP_HOME

# Expose assets for web container
VOLUME $APP_HOME/public/assets

EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0
