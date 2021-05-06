build:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material build

serve:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

clean:
	rm -rf site

publish:
	aws s3 sync public s3://help.tower.nf/ \
	--cache-control max-age=2592000 \
	--metadata-directive REPLACE \
	--storage-class STANDARD \
	--delete \
	--acl public-read

dry-pub:
	aws s3 sync public s3://help.tower.nf/ \
	--dryrun \
	--cache-control max-age=2592000 \
	--metadata-directive REPLACE \
	--storage-class STANDARD \
	--delete \
	--acl public-read

invalidate:
	aws cloudfront create-invalidation \
		--distribution-id EE450FY2UY75L \
		--paths '/*'
