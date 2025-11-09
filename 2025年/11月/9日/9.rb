# partitionメソッドとは？

###基本構文
true_group, false_group = array.partition { |item| 条件 }

###偶数・奇数の分離
numbers = [1, 2, 3, 4, 5, 6]
even, odd = numbers.partition { |n| n.even? }
# even => [2, 4, 6]
# odd  => [1, 3, 5]

###文字列の長さで分ける
words = ["apple", "is", "a", "fruit"]
long, short = words.partition { |w| w.length > 3 }
# long  => ["apple", "fruit"]
# short => ["is", "a"]

###with_indexと組み合わせる
word = "rantekun"
odd_chars, even_chars = word.chars.partition.with_index { |_, i| i.odd? }
# odd_chars  => ["a", "t", "k", "n"]
# even_chars => ["r", "n", "e", "u"]


# case式の使い方と使い分け

## 基本構文：値とマッチさせるタイプ (caseに値や変数を渡す)
case value
when 条件1
  処理1
when 条件2
  処理2
else
  デフォルト処理
end

## caseに値を渡さないタイプ（条件を直接評価）
case
when 条件式1
  処理1
when 条件式2
  処理2
end

## 代入式として使う時
grade = case value
        when xxx then yyy
        when xxx then yyy
        else zzz
        end