# schedule.rb に以下のような設定を追加：

set :output, 'log/crontab.log'
set :environment, :development

every 1.hours do
  rake 'article_inspection:changed_to_published'
end