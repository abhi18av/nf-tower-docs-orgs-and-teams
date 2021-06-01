# Nextflow Tower documentation 

## Get started

Clone the repository.
```
git clone https://github.com/seqeralabs/nf-tower-docs.git
```

The docs depends on [`mkdocs`](https://www.mkdocs.org/), [`mkdocs-material`](https://squidfunk.github.io/mkdocs-material/getting-started/) as well as [`mike`](https://github.com/jimporter/mike) for building the docs.


Move to the working directory e.g: `cd nf-tower-docs`.

Build and run mkdocs server:
```
mkdocs serve
```

The result is that a local website is run and can be accessed locally at http://localhost:8000.

**NOTE**: There is a `Makefile` in the repository to simplify the deployment as well.

## Build and publishing 

The docs is build automatically when pushing a change. 

Changes on `master` branch are automatically published to the S3 bucket `help.tower.nf` 
and accessible thought this address http://help.tower.nf

