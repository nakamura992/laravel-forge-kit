# Laravelのセットアップ
## クローンする
```
//　現在のディレクトリのクローンする
git clone https://github.com/nakamura992/laravel-forge-kit.git .

// appフォルダ（名前は任意）を作りそこにクローン
git clone https://github.com/nakamura992/laravel-forge-kit.git app

```
## .envファイルの以下の設定
```
ROOT_APP_NAME=
ROOT_MYSQL_PASSWORD=
```
環境変数を設定する。

## コマンドを実行
```
# windowsの場合
make setup_for_windows

# macの場合（未検証）
make setup_for_mac
```

