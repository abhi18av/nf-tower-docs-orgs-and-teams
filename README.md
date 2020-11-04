## Usage

`clone https://github.com/seqeralabs/nf-tower-docs.git`

Move to the working directory e.g: `cd nf-tower-docs`

`> hugo server`

The result is that a local website is run and can be
accessed from ```http://localhost:1313```.


## Build and publishing 

The docs is build automatically when pushing a change. 

Changes on `master` branch are automatically published to the S3 bucket `help.tower.nf` 
and accessible thought this address 

http://help.tower.nf.s3-website.eu-west-2.amazonaws.com/

