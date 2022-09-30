FROM ruby:2.7.0

ENV BUNDLER_VERSION=2.1.2

RUN gem install bundler -v 2.1.2

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
