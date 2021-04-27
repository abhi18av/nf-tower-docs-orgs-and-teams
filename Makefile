pull:
	docker pull abhi18av/nftower-mkdocs

build:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs abhi18av/nftower-mkdocs mkdocs build

serve:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs abhi18av/nftower-mkdocs mkdocs serve --dev-addr=0.0.0.0:8000

versioned:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs abhi18av/nftower-mkdocs mike serve --dev-addr=0.0.0.0:8000

clean:
	rm -rf site
