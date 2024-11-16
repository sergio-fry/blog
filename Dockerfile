FROM ruby:3.3.6

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install 

COPY . /app

RUN jekyll build
