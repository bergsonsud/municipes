FROM ruby:3.0.3-slim
ENV BUNDLER_VERSION=2.2.32

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler -v 2.2.32

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./

EXPOSE 3000

ENTRYPOINT [".entrypoints/docker-entrypoint.sh"]

