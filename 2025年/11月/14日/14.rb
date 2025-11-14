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