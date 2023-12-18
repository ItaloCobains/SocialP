    # Dockerfile
    FROM ruby:3.1.2

    # Set the working directory in the container
    WORKDIR /app

    # Copy the Gemfile and Gemfile.lock to the container
    COPY Gemfile Gemfile.lock ./

    # Install dependencies
    RUN bundle install

    # Copy the application code to the container
    COPY . .

    # Set environment variables
    ENV RAILS_ENV=development
    ENV RAILS_SERVE_STATIC_FILES=true

    # Precompile assets
    RUN bundle exec rake assets:precompile

    # Expose port 3000
    EXPOSE 3000

    # Start the Rails server
    CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
