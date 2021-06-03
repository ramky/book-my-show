# Compile the assets
bundle exec rake db:exists && bundle exec rake db:migrate || bundle exec rake db:setup
bundle exec rake assets:precompile

# Start the server
bundle exec rails server