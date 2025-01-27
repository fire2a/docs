# Containerized Jekyll Build

This setup will build the Jekyll site inside the container and serve it with live reload enabled. You can access the site at `http://localhost:4000` after running the container.

_Almost a bug: the container does not signal the browser to reload the page after a change. Press Ctrl+R_

```bash
apt install podman
podman build -t fire2a_docs .
# check build_n_serve.sh the default command
podman run -it --rm -v ./site:/app -p 35729:35729 -p 4000:4000 fire2a_docs
# or just serve
podman run -it --rm -v $(pwd):/app -p 35729:35729 -p 4000:4000 fire2a_docs /serve.sh
```


