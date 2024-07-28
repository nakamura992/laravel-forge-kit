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
## コンテナの中で
```
# 一時ディレクトリを作成
mkdir ../temp

# Makefileなど、保持したいファイルを一階層上の一時ディレクトリに移動
mv * ../temp/ 2>/dev/null  # エラーメッセージを無視
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
```
## docker-compose.ymlとDockerfileの変更
`docker/php/Dockerfile`を開く
```
# laravelインストール前にコメントアウト
# インストール後にコメントアウト解除
# RUN npm install
```
最後の `# RUN npm install`のコメントアウトを解除する。
`docker-compose.ymlを開く`
```
# Laravelインストール前はコメントアウト
# - vendor-volumes:/var/www/html/vendor
# - node_modules:/var/www/html/node_modules
```
同じくコメントアウトを解除
