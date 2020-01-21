# サービスに関して

- 名称：China inbenory2

# 環境構築

```
$ git clone git@github.com:china-inventory2/china-inventory2.git
$ cd china-inventory2
$ docker-compose up
$ docker-compose run web bundle exec rails db:create
$ docker-compose run web bundle exec rails db:migrate
```