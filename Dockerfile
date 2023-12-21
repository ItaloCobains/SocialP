FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client netcat
RUN mkdir /myapp
WORKDIR /myapp

# Set environment variables
ENV RAILS_ENV=development
ENV RACK_ENV=development
ENV REDIS_URL=redis://redis:6379/0
ENV DATABASE_URL=postgresql://postgres:mysecretpassword@db:5432/myapp_development

# Install gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Copy the application into the container
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
