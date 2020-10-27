FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.1.2
ADD Gemfile* $APP_HOME/
RUN bundle config set without 'test development'
RUN bundle install 

ADD . $APP_HOME
RUN yarn install --check-files

# set some environment variables hopefully
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_ENV=production

RUN bundle exec rake assets:precompile

# Redirect Rails log to STDOUT for Cloud Run to capture
ENV RAILS_LOG_TO_STDOUT=true

RUN chmod +x entry.sh
ENTRYPOINT ["/app/entry.sh"]

# fargate cluster needs the container to be running on port 80 
# CMD ["rails","server","-b","0.0.0.0","-p","3000"]  
# RAILS_ENV=production bundle exec rake assets:precompile
# apparently you send in the `-e` flag for production now a days
# RAILS_SERVE_STATIC_FILES=true rails server -b 0.0.0.0 -p 3000 -e production
