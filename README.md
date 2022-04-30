# 📔 Reports

A pandoc template to create scientific reports.

See demo: https://andreasfelix.github.io/reports/demo.html

## Setup ⚙️

The `flake.nix` provides a development environment with:

* pandoc + pandoc-crossref
* GNU MAKE
* rsync

Copy this template using nix:

```
nix flake new --template github:andreasfelix/reports <desired name>
```

Activate development environment:

```sh
nix develop
# or install direnv to automatically activate env
direnv allow
```

## Build 🔨

Update global metadata in `metadata.yaml` and adjust the `bibliography.bib` file.

The `reports` environment variable defines which `.md` file will be compiled.

Running

```
reports=demo make all
```

results in:

* `dist`
    * `<name>.html` - web version
    * `<name>.print.html` - paginated web version
    * `<name>.pdf` - pdf file

## Deploy 🚀

You can deploy the `dist` folder to GitHub pages using:

```
make deploy
```
