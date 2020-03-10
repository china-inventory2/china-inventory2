# scripts/launch.sh
bundle install
yarn install
bundle exec puma -C config/puma.rb