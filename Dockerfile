FROM ruby:2.5.5
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler -v 2.0.1 && bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
