FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /app

# Remove a potentially pre-existing server.pid for Rails.
RUN rm -f /app/tmp/pids/server.pid

# Copy the Gemfile and Gemfile.lock into the container
COPY ./Gemfile ./Gemfile.lock ./

ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler -v ${BUNDLER_VERSION} && bundle install --jobs 20 --retry 5

CMD /app/bin/rails s -b 0.0.0.0 -p 5000
EXPOSE 5000