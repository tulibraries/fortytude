FROM ruby:2.5.1
RUN \
      wget -qO- https://deb.nodesource.com/setup_9.x | bash - && \
      wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt-get update -qq && \
      apt-get install -y --force-yes --no-install-recommends \
      nodejs build-essential libpq-dev postgresql-client
ENV GOOGLE_OAUTH_CLIENT_ID=$GOOGLE_OAUTH_CLIENT_ID
ENV GOOGLE_OAUTH_SECRET=$GOOGLE_OAUTH_SECRET
RUN mkdir /manifold
WORKDIR /manifold
ENV BUNDLER_VERSION 2.0.2
ADD Gemfile .
ADD Gemfile.lock .
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
