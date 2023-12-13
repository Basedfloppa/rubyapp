  FROM ruby:3.2.2-alpine3.17 AS builder
  RUN apk add \
    build-base \
    postgresql-dev
  COPY Gemfile* .
  RUN bundle install
   FROM ruby:3.2.2-alpine3.17 AS runner
  RUN apk add \
      tzdata \
      nodejs \
      postgresql-dev
  WORKDIR /app
  COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
  COPY . .
  EXPOSE 3000
  CMD ["rails", "server"]