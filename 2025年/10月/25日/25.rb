### ポイント

next if sentence.body.nil?
result << sentence.body

# next により、nil のときはループをスキップ。
# result に文字列として追加していくが、nil を直接連結しないことでエラー回避できる