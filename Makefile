pull:
	docker pull squidfunk/mkdocs-material

build: 
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material build

serve:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

clean:
	rm -rf site
