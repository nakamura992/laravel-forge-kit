## .env.exampleコピーして.envを作成
```
APP_NAME=
MYSQL_PASSWORD=
```
環境変数を設定する。
## dockerを立ち上げ
ルートディレクトリで下記を実行
```
make build-up
```
成功後appコンテナに入る
```
make app
```
Laravelをインストール
```
composer create-project laravel/laravel .
```
`docker/php/Dockerfile`を開く
```
# laravelインストール前にコメントアウト
# インストール後にコメントアウト解除
# RUN npm install
```
最後の `# RUN npm install`のコメントアウトを解除する。
