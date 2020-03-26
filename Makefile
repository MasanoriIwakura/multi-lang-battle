build:
	./create_file.sh
	docker-compose build

run_all: run_c run_cpp run_go run_java run_python run_ruby

run_c:
	@echo "** C-Lang **" && docker-compose run --rm c-lang && echo

run_cpp:
	@echo "** C++ **" && docker-compose run --rm cpp && echo

run_go:
	@echo "** Golang **" && docker-compose run --rm go && echo

run_java:
	@echo "** Java **" && docker-compose run --rm java && echo

run_python:
	@echo "** Python **" && docker-compose run --rm python && echo

run_ruby:
	@echo "** Ruby **" && docker-compose run --rm ruby && echo

