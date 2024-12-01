FROM ruby:3.3.6 AS builder
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install 
COPY . /app
RUN jekyll build

FROM ruby:3.3.6
RUN apt update
RUN apt install -y wget host
RUN wget https://dist.ipfs.tech/kubo/v0.32.1/kubo_v0.32.1_linux-amd64.tar.gz
RUN tar -xvzf kubo_v0.32.1_linux-amd64.tar.gz

COPY --from=builder /app/_site/ /usr/share/nginx/html
