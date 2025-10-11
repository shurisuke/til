####### 例：hash.each.with_index の使い方

scores = { alice: 90, bob: 85, charlie: 92 }

scores.each.with_index do |(name, score), index|
  puts "#{index + 1}. #{name} - #{score}"
end


####### 基本例：要素の2番目（数値）で昇順ソート

data = [["Alice", 30], ["Bob", 20], ["Charlie", 25]]
sorted = data.sort_by { |name, age| age }

p sorted
# => [["Bob", 20], ["Charlie", 25], ["Alice", 30]]


#######ハッシュでは [キー] = 値 の形で追加できる。

user_data = {}
["Alice", "Bob", "Charlie"].each do |name|
  user_data[name] = { age: rand(18..30) }
end

p user_data
# => {"Alice"=>{:age=>20}, "Bob"=>{:age=>29}, "Charlie"=>{:age=>24}}


#######<<（シャベル演算子）や push を用いることで、ループのたびに配列へ新しい値を追加できる。

numbers = []
(1..5).each do |n|
  numbers << n * 2
end

p numbers
# => [2, 4, 6, 8, 10]