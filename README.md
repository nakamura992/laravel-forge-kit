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

まとめてコピーして貼り付ける
```
docker-compose up -d --build
docker-compose exec app bash
# 成功後appコンテナに入る
```
## コンテナの中で
まとめてコピーして貼り付ける。
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
同じくまとめてコピーして貼り付ける
ルートの.envファイルの環境変数をsrcの中の環境変数に追加
```
cat .env > src/.env.tmp
cat ./src/.env >> src/.env.tmp
copy src/.env.tmp src/.env
rm src/.env.tmp
```

## 再度コンテナに入る
```
docker-compose exec app bash
```
同じくまとめてコピーして貼り付ける
```
#マイグレーションを実行
php artisan migrate

#以下権限設定
#ubuntu debianOSの場合
chown -R www-data:www-data /var/www/html
# ディレクトリを755に設定
find . -type d -exec chmod 755 {} \;

# ファイルを644に設定
find . -type f -exec chmod 644 {} \;

# storage と bootstrap/cache を書き込み可能に設定
chmod -R 775 ./storage
chmod -R 775 ./bootstrap/cache

#artisanに実行権限
chmod 755 artisan
```

最後の `# RUN npm install`のコメントアウトを解除する。
## docker-compose.ymlの変更
```
# Laravelインストール後コメントアウトを解除
# - vendor-volumes:/var/www/html/vendor
# - node_modules:/var/www/html/node_modules
```
同じくコメントアウトを解除
