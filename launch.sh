# scripts/launch.sh
rm -f tmp/pids/server.pid
bundle install
bundle exec puma -C config/puma.rb