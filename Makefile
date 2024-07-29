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


# Laravel setup for Mac/Linux
setup_for_mac:
	@read -p "Are you sure you want to continue? (yes/no) " choice; \
	if [ "$$choice" = "yes" ]; then \
		sh bin/sh/setup.sh; \
	else \
		echo "Setup cancelled."; \
	fi

# Laravel setup for Windows
setup_for_windows:
	@powershell -Command " \
		$$choice = Read-Host 'Are you sure you want to continue? (yes/no)'; \
		if ($$choice -eq 'yes') { \
			& '.\bin\bat\setup.bat'; \
		} else { \
			Write-Host 'Setup cancelled.' \
		}"

# override.yml
ovr-init:
	docker-compose -f docker-compose.yml -f docker-compose.init.yml up -d --build
	docker-compose -f docker-compose.yml -f docker-compose.init.yml run --rm app sh -c "composer install && npm install"
	docker-compose -f docker-compose.yml -f docker-compose.init.yml down
	docker-compose up -d