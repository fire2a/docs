#!/bin/bash
set -x

bundle exec jekyll serve --livereload --host 0.0.0.0 --force_polling
