FROM ruby:3.1-alpine

RUN apk add --no-cache g++ gcc make musl-dev curl

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4567

HEALTHCHECK --interval=10s --timeout=3s --start-period=1ms \
  CMD curl -f http://localhost:4567/healthcheck || exit 1

CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
