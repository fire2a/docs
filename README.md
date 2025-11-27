# Fire2a user documentation webpage

This "GitHub Pages" hosted page is published [here](https://fire2a.github.io/docs/)

Using [just-the-docs-template](https://github.com/just-the-docs/just-the-docs-template) Jekyll Pages action

The content is located in `site` directory, and it is mainly just markdown files

## Contributing
Please feel free to contribute by opening a pull request, to preview your changes locally, you can use the following methods:

### Container
This setup will build the Jekyll site inside the container and serve it with live reload enabled.

You can access the site at `http://localhost:4000` after running the container.
```bash
sudo apt install podman

# build the container named fire2a_docs
podman build -t fire2a_docs .

# build_n_serve.sh is the default command
podman run -it --rm -v ./site:/app -p 35729:35729 -p 4000:4000 fire2a_docs

# or just serve (after build)
cd site
podman run -it --rm -v $(pwd):/app -p 35729:35729 -p 4000:4000 fire2a_docs /serve.sh
```

### Local hosting on debian
#### install
```bash
sudo apt-get install ruby-full ruby-bundler jekyll build-essential
```
#### build
```
cd <repo/root>/site
bundle config set --local path 'vendor/bundle'
bundle install
```
#### live serve
Editing and saving will automatically update the page.  
```bash
bundle exec jekyll serve --livereload
...
LiveReload address: http://127.0.0.1:35729
    Server address: http://127.0.0.1:4000  <--- OPEN IN BROWSER
  Server running... press ctrl-c to stop.
```

## update just-the-docs dependencies
Dependabot will automatically create a pull request to update the just-the-docs version.
```bash
git switch dependabot/bundler/just-the-docs-0.8.2
# check compatibility
ruby -v
node -v
# clean
git clean -dfX -n
git clean -dfX
cd site
rm Gemfile.lock
rm -r .bundle vendor/bundle
bundle clean --force
# rebuild
```

## references
https://github.com/just-the-docs/just-the-docs  
https://jekyllrb.com/docs/installation/other-linux/  

