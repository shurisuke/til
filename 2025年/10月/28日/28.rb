# Gemfile.lockとは

### gemfile.lock関係でエラー（依存関係に関係するエラー）が起きた時の対処法　（コード参照）
##### 1,masterブランチとの差分を把握
git diff master -- Gemfile.lock
##### 2,エラーとの関係を洗う
##### 3,関係する場合はmasterブランチの時に一度戻す
git checkout master -- Gemfile.lock
git checkout master -- Gemfile
##### 4,install後にもう一度状態を見る
docker compose exec web bundle install
