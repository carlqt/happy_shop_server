FROM ruby:2.5.5
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler -v 2.0.1
RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]