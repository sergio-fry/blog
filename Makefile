all: build run

build:
	docker build -t blog .

run:
	docker run -it -p 9292:9292 blog
