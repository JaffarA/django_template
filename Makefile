makemigrations:
	docker exec -it <<project_name>>-web-1 poetry run python manage.py makemigrations

migrate:
	docker exec -it <<project_name>>-web-1 poetry run python manage.py migrate

mmigrate:
	make makemigrations && make migrate

shell:
	docker exec -it <<project_name>>-web-1 poetry run python manage.py shell

format:
	poetry run black .
	poetry run isort .

vulture:
	poetry run vulture . --min-confidence 80

dead:
	poetry run vulture . --min-confidence 100

build:
	docker compose up --build

run:
	docker compose up
