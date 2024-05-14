rm -f /app/tmp/pids/server.pid

# Create the database if it hasn't been created already
bundle
rails db:create
rails db:migrate