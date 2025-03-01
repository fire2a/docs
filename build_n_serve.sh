#!/bin/bash
set -x

cd /app
# git clean -dfX # messes unchanged files
rm -f Gemfile.lock
rm -fr .bundle vendor/bundle
bundle clean --force
bundle config set --local path 'vendor/bundle'
bundle install
bundle exec jekyll serve --livereload --host 0.0.0.0 --force_polling
