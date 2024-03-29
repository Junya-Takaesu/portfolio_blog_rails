FROM ruby:3.0.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn jq
WORKDIR /blog
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
COPY . .
RUN rails webpacker:install && yarn add -D webpack-cli && yarn
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]