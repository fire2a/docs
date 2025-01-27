#!/bin/bash
set -x

cd /app
bundle exec jekyll serve --livereload --host 0.0.0.0 --force_polling
