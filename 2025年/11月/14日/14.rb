1. select, group, having の関係性を整理できた
.select("category.name, SUM(payment.amount) AS revenue")
.group("category.name")
.having("revenue >= ?", 100)

