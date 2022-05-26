# gets the docker image of ruby 2.7.3 and lets us build on top of that
FROM ruby:2.7.3

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev

# create a folder /blcer-main in the docker container and go into that folder
RUN mkdir /blcer-main
WORKDIR /blcer-main

# Copy the Gemfile and Gemfile.lock from app root directory into the /blcer-main/ folder in the docker container
COPY Gemfile Gemfile.lock ./

# Run bundle install to install gems inside the gemfile
RUN bundle check || bundle install

# Copy the whole app
COPY . /blcer-main