# form_with の scope パラメータ
###scope: :session とすると、送られるパラメータは params[:session][:email] のような形式になる
= form_with url: login_path, scope: :session, local: true do |f|
    = f.label :email
    = f.text_field :email

  # 送信される params はこうなる：
  # {
  #   "session" => {
  #     "email" => "入力されたメール"
  #   }
  # }


# LIKE 検索の SQL と Rails
# NG（SyntaxErrorになる）
Sentence.where("body LIKE "%パスタ%"")

# OK（SQL文字列をシングルクォートで囲み、LIKEの中身はダブルクォート or 変数展開）
Sentence.where('body LIKE ?', "%パスタ%")


# スコープの切り出し

##モデルに共通処理を切り出せる：
# Article モデル
scope :like_body, ->(word) { where('body LIKE ?', "%#{word}%") }

# 呼び出し例
Article.like_body("Rails")


