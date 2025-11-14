1. select, group, having の関係性を整理できた
.select("category.name, SUM(payment.amount) AS revenue")
.group("category.name")
.having("revenue >= ?", 100)


2. whereとhavingの違いを学んだ
whereで絞る例（OK）：             Payment.where(amount: 5)
havingで絞る例（OK）：            Category
                                .group("category.name")
                                .having("SUM(payment.amount) >= ?", 100)
whereに集計関数を使うとエラー（NG）：Category.where("SUM(payment.amount) >= ?", 100)


3. only_full_group_by モードによるエラーと対処
参考コード（OK）：                  Category
nameもgroupに含めることでエラー回避   .select("category.category_id, category.name, COUNT(*) AS number_of_film")
                                  .joins(:film_categories)
                                  .group("category.category_id, category.name")

参考コード（NG）：                  Category
nameをgroupに含めていない → エラー   .select("category.category_id, category.name, COUNT(*) AS number_of_film")
                                  .joins(:film_categories)
                                  .group("category.category_id")


4. アソシエーション名とテーブル名の使い分けを理解した

Film.joins(:actors) # アソシエーション名（:actors）

# select句では実テーブル名（actor, filmなど）を使う
Film
  .select("film.title, COUNT(actor.actor_id) AS number_of_actor")
  .joins(:actors)
  .group("film.title")


5. 多段joinsと中間テーブルの活用方法を整理できた
Category
.joins(film_categories: { film: { inventories: { rentals: :payments } } })
.select("category.name, SUM(payment.amount) AS revenue")
.group("category.name")


6. .to_sqlでSQLを確認する習慣が身についた
query = Film
  .select("film.title, COUNT(actor.actor_id) AS number_of_actor")
  .joins(:actors)
  .group("film.title")

puts query.to_sql