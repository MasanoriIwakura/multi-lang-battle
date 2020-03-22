build:
	docker-compose build

run_all: run_c run_cpp run_go

run_c:
	echo "** C-Lang **" && docker-compose run --rm c-lang && echo

run_cpp:
	echo "** C++ **" && docker-compose run --rm cpp && echo

run_go:
	echo "** Golang **" && docker-compose run --rm go && echo
