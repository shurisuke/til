# 配列に文字列が含まれるかどうかを確認する方法
array.include?("banana")  # true

# 完全一致
["apple", "banana"].include?("apple") #=> true

# 部分一致
["apple", "banana"].any? { |word| word.include?("app") } #=> true

# 正規表現
["apple", "banana"].grep(/app/) #=> ["apple"]