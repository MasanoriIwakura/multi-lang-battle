C_CSV = apps/c-lang/csv

run_csv_c:
	docker-compose run --rm app "gcc -o ${C_CSV}/main ${C_CSV}/main.c && ${C_CSV}/main"