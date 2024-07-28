# Laravelのセットアップ
## .env.exampleコピーして.envを作成
```
ROOT_APP_NAME=
ROOT_MYSQL_PASSWORD=
```
環境変数を設定する。
## dockerを立ち上げ
ルートディレクトリで下記を実行

※コマンドはまとめて貼り付けて実行できます。
※コメントを含めても大丈夫です。（コードセクションごとに右上のコピーボタンからコピーしてはりつけてね）

脳死で順番にコピペ
```
docker-compose up -d --build
docker-compose exec app bash
# 成功後appコンテナに入る
```
## コンテナの中で
時間がかかるので何も触らない
```
# 一時ディレクトリを作成
mkdir ../temp

# Makefileなど、保持したいファイルを一階層上の一時ディレクトリに移動
mv * ../temp/ 2>/dev/null
mv .* ../temp/ 2>/dev/null

# Laravelをインストール
composer create-project laravel/laravel .

# 一階層上に移動
cd ..

# 一時的に移動したファイルを元のディレクトリに戻す
mv temp/* html/ 2>/dev/null
mv temp/.* html/ 2>/dev/null

# 一時ディレクトリを削除
rmdir temp

# プロジェクトディレクトリに戻る
cd html

# パッケージなどをインストール
composer install
npm install

# keyを生成する
php artisan key:generate

# 抜ける
exit
```
## ホスト側で
ルートの.envファイルの環境変数をsrcの中の環境変数に追加
```
cat .env > src/.env.tmp
cat ./src/.env >> src/.env.tmp
copy src/.env.tmp src/.env
rm -rf src/.env.tmp
```

## 再度コンテナに入る
```
docker-compose exec app bash
php artisan migrate
```

## Dockerfileの変更
`docker/php/Dockerfile`を開く
```
# laravelインストール前にコメントアウト
# インストール後にコメントアウト解除
# RUN npm install
```
最後の `# RUN npm install`のコメントアウトを解除する。
## docker-compose.ymlの変更
```
# Laravelインストール後コメントアウトを解除
# - vendor-volumes:/var/www/html/vendor
# - node_modules:/var/www/html/node_modules
```
同じくコメントアウトを解除
