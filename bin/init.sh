#!/bin/sh
set +x

bundle check || bundle install --jobs 20 --retry 5

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi
bin/rails db:environment:set RAILS_ENV=$RAILS_ENV
bin/rails s -p $PORT -b 0.0.0.0 -e $RAILS_ENV