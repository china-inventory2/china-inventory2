# scripts/launch.sh
rm -f tmp/pids/server.pid
bundle install
cp -rf /tmp/public/* /myapp/public/
mkdir -p tmp/sockets
bundle exec puma -C config/puma.rb