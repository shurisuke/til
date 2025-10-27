# ① whenever を導入する

### Gemfile
group :development do
  gem 'whenever', require: false
end

## bundle install


# ② schedule.rb を作成

$ bundle exec wheneverize .

### config/schedule.rb
set :output, "log/cron.log"
env :PATH, ENV['PATH'] # rbenv や rbenv-vars 対応

every 5.minutes do
  rake "articles:publish"
end


③ whenever で cronファイルを出力

コンテナで cron に登録するには、 whenever を使って crontab を生成する必要があるため、以下を行う。

$ bundle exec whenever --update-crontab


# ④ Dockerfileに cron と whenever 処理を追加

RUN apt-get update -qq && apt-get install -y cron

### whenever 実行用に crontab を登録
RUN bundle exec whenever --update-crontab

### ただし、cronはサービスとして起動する必要があります


# ⑤ cron を起動させるエントリポイントを用意　　例えば entrypoint.sh を作成：

### !/bin/bash
set -e

### crontab 登録（念のため毎回やっておくと安全）
bundle exec whenever --update-crontab

### cron 起動（バックグラウンドで）
cron

### rails サーバ起動など
exec "$@"


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


# ⑥ docker-compose.ymlの確認

services:
  web:
    build: .
    command: bash -c "bundle exec rails s -b 0.0.0.0"
    volumes:
      - .:/app
    depends_on:
      - db
バックグラウンドで cron が動いて、rakeタスクが定期実行されるようになる


# ⑦ ログの確認方法
docker compose exec web tail -f log/cron.log
docker compose exec web tail -f log/cron_error.log # stderr を分けてるなら