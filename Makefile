html:
	docker run -v $$PWD:$$PWD -w $$PWD klakegg/hugo:0.77.0-alpine
	
serve:
	docker run -p 1313:1313 -v $$PWD:$$PWD -w $$PWD klakegg/hugo:0.77.0-alpine serve

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