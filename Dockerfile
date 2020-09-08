FROM ruby:latest

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.1.2
ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
RUN yarn install --check-files

# set some environment variables hopefully
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_ENV=production
ENTRYPOINT [ "bundle", "exec" ]
# fargate cluster needs the container to be running on port 80 
CMD ["rails","server","-b","0.0.0.0","-p","80"]  

# CMD ["RAILS_ENV=production","bundle","exec","rake","assets:precompile","&&","RAILS_SERVE_STATIC_FILES=true","RAILS_ENV=production","rails","server","-b","0.0.0.0","-p","3000"]
