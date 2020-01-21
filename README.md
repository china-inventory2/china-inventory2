# サービスに関して

- 名称：China inbenory2

# 環境構築

```
docker desktopをインストールする。
$ git clone git@github.com:china-inventory2/china-inventory2.git
$ cd china-inventory2

初回時はこれ　（imageがなければimageビルドから）コンテナの起動までを行う
$ docker-compose up

bundle installはこれ。　vendor/bundleにインストールされるように設定してあります。
$ docker-compose run web bundle install

マイグレートはこれ。
$ docker-compose run web bundle exec rails db:create
$ docker-compose run web bundle exec rails db:migrate

作業を終了する時はコンテナを終了させます。
$ docker-compose stop

2回目以降からは以前に作ったコンテナを起動させます。
$ docker-compose start

それぞれのコンテナのターミナルに直接アクセス  ●●●はコンテナID
docker exec -it ●●● /bin/bash
```

# Dockerの操作マニュアルはこちら
```
https://qiita.com/okyk/items/a374ddb3f853d1688820
```