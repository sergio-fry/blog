FROM ruby:3.3.6 AS builder
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install 
COPY . /app
RUN jekyll build

FROM ruby:3.3.6
WORKDIR /app
COPY .build/server/Gemfile .build/server/Gemfile.lock /app/
RUN bundle install 

COPY .build/server /app
RUN chmod +x entrypoint.sh

COPY --from=builder /app/_site/ /app/_site

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["web"]
