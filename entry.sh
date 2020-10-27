#!/bin/bash

if [ $PORT ]; then
    bundle exec rails server -b 0.0.0.0 -e production -p $PORT
else
    bundle exec rails server -b 0.0.0.0 -e production -p 3000
fi
# rails server -b 0.0.0.0 -p $PORT -e production
