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
podman run -it --rm -v ./site:/app -p 35729:35729 -p 4000:4000 fire2a_docs /serve.sh
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

## Mantainance
Dependabot will automatically create a pull requests to update github actions.  
Only the `just-the-docs` gem needs attention.
### testing the just-the-docs dependencies update
Although it usually works fine, sometimes there are compatibility issues with ruby or node versions.  
Test locally and also on the Actions CI before merging.  
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
Usually `Gemfile.lock` changes are only the ones proposed by dependabot, tested automatically on the CI github actions.  
If the CI fails, adjust locally matching/changing the same configuration (ubuntu-latest, ruby version, node version) until it works.
#### tl;dr: don't commit Gemfile.lock changes manually

## references
https://github.com/just-the-docs/just-the-docs  
https://jekyllrb.com/docs/installation/other-linux/  

