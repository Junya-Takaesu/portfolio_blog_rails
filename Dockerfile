FROM ruby:3.0.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn jq
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN bundle install
COPY . /blog
RUN rails webpacker:install

EXPOSE 3000

RUN useradd -m myuser
USER myuser

CMD ["rails", "server", "-b", "0.0.0.0"]