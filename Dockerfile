FROM ruby:3.3.6 AS builder

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install 

COPY . /app

RUN jekyll build

FROM nginx:alpine
COPY --from=builder /app/_site/ /usr/share/nginx/html
