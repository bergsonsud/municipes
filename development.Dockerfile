FROM ruby:3.0.3-slim
ENV BUNDLER_VERSION=2.2.32

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    curl \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips42 && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install nodejs yarn \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yarn install

RUN gem install bundler -v 2.2.32

WORKDIR /app
COPY Gemfile Gemfile.lock ./
COPY --chown=$APP_USER yarn.lock package.json ./

RUN bundle install
COPY . ./

RUN bundle exec rake assets:precompile

EXPOSE 3000

#CMD ["sh"," ./entrypoints/docker-entrypoint.sh"]
CMD ["sleep","infinity"]
