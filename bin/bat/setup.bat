@echo off
setlocal enabledelayedexpansion

:: コンテナをビルドして起動
docker-compose -f docker-compose.yml -f docker-compose.init.yml up -d --build

:: コンテナ内での作業
echo exec command: mkdir ../temp
docker-compose exec -T app bash -c "mkdir ../temp"

echo exec command: mv * ../temp/ 2^>/dev/null ^|^| true
docker-compose exec -T app bash -c "mv * ../temp/ 2>/dev/null || true"

echo exec command: mv .* ../temp/ 2^>/dev/null ^|^| true
docker-compose exec -T app bash -c "mv .* ../temp/ 2>/dev/null || true"

echo exec command: composer create-project laravel/laravel .
docker-compose exec -T app bash -c "composer create-project laravel/laravel ."

echo exec command: cd .. ^&^& mv temp/* html/ 2^>/dev/null ^&^& mv temp/.* html/ 2^>/dev/null ^&^& rmdir temp ^&^& cd html
docker-compose exec -T app bash -c "cd .. && mv temp/* html/ 2>/dev/null && mv temp/.* html/ 2>/dev/null && rmdir temp && cd html"

echo exec command: composer install
docker-compose exec -T app bash -c "composer install"

echo exec command: npm install
docker-compose exec -T app bash -c "npm install"

:: .env.exampleから.envを複製
echo exec command: copy src/.env.example src/.env
copy src/.env.example src/.env

:: ルートディレクトリの.envを一時ファイルにコピー
copy .env src\.env.tmp

:: Laravelの.envを一時ファイルの末尾に追加
type src\.env >> src\.env.tmp

:: 一時ファイルをLaravelの.envにコピー
copy src\.env.tmp src\.env

:: 一時ファイルを削除
del src\.env.tmp

:: 再度コンテナ内での作業

echo exec command: php artisan key:generate
docker-compose exec -T app bash -c "php artisan key:generate"

echo exec command: php artisan migrate
docker-compose exec -T app bash -c "php artisan migrate"

echo exec command: chown -R www-data:www-data /var/www/html
docker-compose exec -T app bash -c "chown -R www-data:www-data /var/www/html"

echo exec command: find . -type d -exec chmod 755 {} \;
docker-compose exec -T app bash -c "find . -type d -exec chmod 755 {} \;"

echo exec command: find . -type f -exec chmod 644 {} \;
docker-compose exec -T app bash -c "find . -type f -exec chmod 644 {} \;"

echo exec command: chmod -R 775 ./storage
docker-compose exec -T app bash -c "chmod -R 775 ./storage"

echo exec command: chmod -R 775 ./bootstrap/cache
docker-compose exec -T app bash -c "chmod -R 775 ./bootstrap/cache"

echo exec command: chmod 755 artisan
docker-compose exec -T app bash -c "chmod 755 artisan"

echo Setup completed.