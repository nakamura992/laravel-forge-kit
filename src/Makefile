default:
	@echo "利用可能なコマンド:"
	@echo "  make migrate        - php artisan migrate"
	@echo "  make mig-roll       - php artisan migrate:rollback"
	@echo "  make mig-status     - php artisan migrate:status"
	@echo "  make seed           - php artisan db:seed"
	@echo "  make tinker         - php artisan tinker"
	@echo "  make test           - php artisan test"
	@echo "  make cache-clear    - php artisan cache:clear"
	@echo "  make config-clear   - php artisan config:clear"
	@echo "  make view-clear     - php artisan view:clear"
	@echo "  make m-mig          - php artisan make:migration create_$${name}_table"
	@echo "  make a-mig          - php artisan make:migration add_$${column}_to_$${table}_table --table=$${table}"
	@echo "  make c-mig          - php artisan make:migration change_$${column}_in_$${table}_table --table=$${table}"
	@echo "  make d-mig          - php artisan make:migration drop_$${column}_from_$${table}_table --table=$${table}"
	@echo "  make m-model        - php artisan make:model $$name"
	@echo "  make m-model-mig    - php artisan make:model $$name -m"
	@echo "  make m-ctrl         - php artisan make:controller $${name}Controller"
	@echo "  make m-rule         - php artisan make:rule $$name"
	@echo "  make m-middleware   - php artisan make:middleware $$name"
	@echo "  make m-cm           - php artisan make:component $$name"
	@echo "  make m-test         - php artisan make:test $$name"
	@echo "  make m-command      - php artisan make:command $$name"
	@echo "  make m-factory      - php artisan make:factory $$name --model=$${model}"
	@echo "  make m-mail         - php artisan make:mail $$name"
	@echo "  make m-ctrl-api     - php artisan make:controller Api/$${name}Controller --api"



# Laravelコマンド
migrate:
	php artisan migrate

mig-roll:
	php artisan migrate:rollback

mig-status:
	php artisan migrate:status

seed:
	php artisan db:seed

tinker:
	php artisan tinker

test:
	php artisan test

cache-clear:
	php artisan cache:clear

config-clear:
	php artisan config:clear

view-clear:
	php artisan view:clear

# マイグレーションを作成
m-mig:
	@read -p "マイグレーション名を入力してください: " name; \
	php artisan make:migration create_$${name}_table

a-mig:
	@read -p "カラム名を入力してください: " column; \
	read -p "テーブル名を入力してください: " table; \
	php artisan make:migration add_$${column}_to_$${table}_table --table=$${table}

c-mig:
	@read -p "変更するカラム名を入力してください: " column; \
	read -p "テーブル名を入力してください: " table; \
	php artisan make:migration change_$${column}_in_$${table}_table --table=$${table}

d-mig:
	@read -p "削除するカラム名を入力してください: " column; \
	read -p "テーブル名を入力してください: " table; \
	php artisan make:migration drop_$${column}_from_$${table}_table --table=$${table}

# モデルを作成
m-model:
	@read -p "モデル名を入力してください: " name; \
	php artisan make:model $$name

m-model-mig:
	@read -p "モデル名を入力してください: " name; \
	php artisan make:model $$name -m

m-rule:
	@read -p "ルール名を入力してください: " name; \
	php artisan make:rule $$name

# コントローラを作成
m-ctrl:
	@read -p "コントローラ名を入力してください: " name; \
	php artisan make:controller $${name}Controller

# ミドルウェアを作成
m-middleware:
	@read -p "ミドルウェア名を入力してください: " name; \
	php artisan make:middleware $$name

m-cm:
	@read -p "コンポーネント名を入力してください(例: ComponentName): " name; \
	php artisan make:component $$name

m-test:
	@read -p "テスト名を入力してください(例: ExampleTest): " name; \
	php artisan make:test $$name

m-command:
	@read -p "コマンド名を入力してください(例: CommandName): " name; \
	php artisan make:command $$name

m-factory:
	@read -p "ファクトリ名を入力してください(例: UserFactory): " name; \
	read -p "モデル名を入力してください(例: User): " model; \
	php artisan make:factory $$name --model=$${model}

m-mail:
	@read -p "メール名を入力してください(例: ExpirationReminder): " name; \
	php artisan make:mail $$name

m-ctrl-api:
	@read -p "コントローラ名を入力してください(例: UserController): " name; \
	php artisan make:controller Api/$${name}Controller --api
