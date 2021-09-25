# inquistive-backend

## 本番環境

http://3.113.26.48/

## 開発環境構築手順

- rbenv(rubyのバージョン管理ツール)インストール

https://qiita.com/hujuu/items/3d600f2b2384c145ad12

- ruby2.7.1インストール

```
$ rbenv install 2.7.1
$ rbenv local 2.7.1 (←ルートディレクトリで行う)
```


以下ルートディレクトリでの作業

- 開発環境用の.envファイルをダウンロードしてルートに追加

https://files.slack.com/files-pri/TT0KSMXHV-F02F7PP4U4F/download/.env

- gemインストール

`bundle install --path vendor/bundle`

- サーバー起動

`bundle exec rails s`

http://localhost:3000 にアクセス
