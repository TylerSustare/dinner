#!/bin/bash

if [ $PORT ]; then
    bundle exec rails server -b 0.0.0.0 -p $PORT -e production
else
    bundle exec rails server -b 0.0.0.0 -p 3000 -e production
fi
# rails server -b 0.0.0.0 -p $PORT -e production
