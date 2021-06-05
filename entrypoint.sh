# Run tests first
RAILS_ENV=test bundle exec rake db:create
RAILS_ENV=test bundle exec rspec spec

# Create prod database only if it doesn't exist
bundle exec rake db:exists && bundle exec rake db:migrate || bundle exec rake db:setup
# Compile the assets
bundle exec rake assets:precompile

# Start the server
bundle exec rails server