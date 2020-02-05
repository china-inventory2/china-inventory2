# サービスに関して

- 名称：China inbenory2(個人開発用)


# 環境構築

```
docker desktopをインストールする。
$ git clone git@github.com:china-inventory2/china-inventory2.git
$ cd china-inventory2

初回時はこれ（imageがなければimageビルドから）コンテナの起動までを行う。初回は起動に失敗すると思います。
$ docker-compose up

bundle installはこれ。railsが入ってるコンテナのvendor/bundleにインストールされるよう設定してあります。
$ docker-compose run web bundle install

Gemfileに変更を加えた場合はこれですが、Gemをインストールする場合は事前にご連絡ください。
$ docker-compose run web bundle install
$ docker-compose build

マイグレートはこれ。
$ docker-compose run web bundle exec rails db:create
$ docker-compose run web bundle exec rails db:migrate

作業を終了する時はコンテナを終了させます。
$ docker-compose stop

2回目以降からは以前に作ったコンテナを起動させます。
$ docker-compose start

それぞれのコンテナのターミナルに直接アクセス  ●●●はコンテナID
$ docker exec -it ●●● /bin/bash

railsコマンドを使用するときはvendor/bundle配下のrailsを使うようにします。
$ docker-compose run web bundle exec rails ●●●●●●●●● ~

モデルでのテストコードを作っていく場合は下記のようにして
docker-compose run web bundle exec rails g rspec:model model_name

コントローラーでのテストコードを作っていく場合は下記のようにする。コントローラー名にsをつけるのを忘れずに。
docker-compose run web bundle exec rails g rspec:model controllers_name

```
# Dockerの操作マニュアルはこちら
```
https://qiita.com/okyk/items/a374ddb3f853d1688820
```
# Rspecの操作マニュアルはこちら
```
初めてRSpecでRailsアプリのモデルをテストする
https://qiita.com/y4u0t2a1r0/items/ae4d832fbfb697b4b253

初めてRSpecでRailsアプリのコントローラーをテストする
https://qiita.com/y4u0t2a1r0/items/f875bc5a07895ff1cd27
```
# etc...
```
何かあれば適宜追加します。
```
