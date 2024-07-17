# Fire2a documentation repo

This repo uses the [just-the-docs-template](https://github.com/just-the-docs/just-the-docs-template) Jekyl Pages action.  
The source for its content is in the docs directory.  
Check the live [page](https://fire2a.github.io/docs/).  

## About Us

We are a research group that seeks solutions to complex problems arising from the terrestrial ecosystem and its natural and anthropogenic disturbances,such as wildfires.

Currently hosted at [ISCI](https://isci.cl) offices.

Contact us at <a href="mailto:fire2a@fire2a.com">fire2a@fire2a.com</a>.

[content licence](./LICENCE)
[just-the-docs-licence](./just-the-docs-LICENCE)

## local hosting on debian
### install & build

    sudo apt-get install ruby-full ruby-bundler jekyll build-essential
    cd repo/root/
    bundle config set --local path 'vendor/bundle'
    bundle install

### serve

    bundle exec jekyll serve --livereload

    # ctrl+click here to open
    ...
    Server address: http://127.0.0.1:4000
    ...

### update just-the-docs
    
    # Check the dependabot automatic pull request
    git pull
    git switch dependabot/bundler/just-the-docs-0.8.2
    # check compatibility
    ruby -v
    node -v
    # clean
    rm Gemfile.lock
    rm -r vendor/bundle
    bundle clean --force
    # rebuild

### references
https://github.com/just-the-docs/just-the-docs
https://jekyllrb.com/docs/installation/other-linux/

