command-list:
	@echo "command-list:"
	@echo " make build        - docker-compose build"
	@echo " make build-up     - docker-compose up -d --build"
	@echo " make nbuild       - docker-compose build --no-cache"
	@echo " make up           - docker-compose up -d"
	@echo " make down         - docker-compose down"
	@echo " make app          - docker-compose exec app bash"
	@echo " make app-www-data - docker-compose exec --user=www-data app bash"


# Docker commands
build:
	docker-compose build

build-up:
	docker-compose up -d --build

nbuild:
	docker-compose build --no-cache

up:
	docker-compose up -d

down:
	docker-compose down

app:
	docker-compose exec app bash

app-www-data:
	docker-compose exec --user=www-data app bash