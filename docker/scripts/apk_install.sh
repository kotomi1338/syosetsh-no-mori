# ==============================================================================
# docker - scripts - apk install
# ==============================================================================
apk --update --no-cache add \
  alpine-sdk \
  libxml2-dev \
  libxslt-dev \
  postgresql-client \
  postgresql-dev \
  nodejs \
  yarn \
  tzdata \
  less \
  libidn-dev
