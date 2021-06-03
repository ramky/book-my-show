# Compile the assets
rake db:exists && rake db:migrate || rake db:setup
bundle exec rake assets:precompile

# Start the server
bundle exec rails server