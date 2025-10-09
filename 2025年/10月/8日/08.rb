### 今日学んだことのサンプルコード

# 例：ActiveRecordでレコード作成
user = User.new
user.name = "David"
user.occupation = "Code Artist"
user.save



### whereメソッドに関するサンプルコード

users = User.where(name: "taro")
users.class
# => ActiveRecord::Relation

users.pluck(:email)
# => ["taro@example.com", "taro2@example.com"]



### updateとupdate!の違い

user.update(name: nil)
# => false

user.update!(name: nil)
# => ActiveRecord::RecordInvalid (Validation failed)