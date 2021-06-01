# Compile the assets
bundle exec rake assets:precompile
bundle exec rail db:migrate

# Start the server
bundle exec rails server