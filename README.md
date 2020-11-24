# Nextflow Tower documentation 

## Get started

Clone the repository.
```
git clone https://github.com/seqeralabs/nf-tower-docs.git
```

Follow the instructions from https://gohugo.io/getting-started/installing to complete the Hugo installation in your
local system.

Move to the working directory e.g: `cd nf-tower-docs`.

For Linux users, run to start the Hugo server:
```
./hugo.sh server
```

For Mac users, run the following command to start the Hugo server:
```
hugo server
```

The result is that a local website is run and can be
accessed locally at http://localhost:1313.


## Build and publishing 

The docs is build automatically when pushing a change. 

Changes on `master` branch are automatically published to the S3 bucket `help.tower.nf` 
and accessible thought this address http://help.tower.nf


