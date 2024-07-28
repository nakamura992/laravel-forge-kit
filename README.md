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
srcの中をいったん退避
```
mv * ../ 2>/dev/null
mv .[!.]* ../ 2>/dev/null
```
```
composer create-project laravel/laravel .
cd ../
```
```
mv src/* . 2>/dev/null
mv src/.* . 2>/dev/null
```
Laravel
`docker/php/Dockerfile`を開く
```
# laravelインストール前にコメントアウト
# インストール後にコメントアウト解除
# RUN npm install
```
最後の `# RUN npm install`のコメントアウトを解除する。
