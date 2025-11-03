

# simple_form_forでのラジオボタン実装方法
= f.input :eye_catch_send, as: :radio_buttons,
  collection: Article.eye_catch_sends.keys.map { |key| [Article.human_attribute_name("eye_catch_send.#{key}"), key] },
  include_blank: falsepm


# enumとi18nによる選択肢の日本語化
###モデル側のenum定義
class Article < ApplicationRecord
  enum eye_catch_send: { left: 0, center: 1, right: 2 }
end

###翻訳ファイルでの設定例（config/locales/ja.yml）
ja:
  activerecord:
    attributes:
      article:
        eye_catch_send:
          left: 左寄せ
          center: 中央寄せ
          right: 右寄せ


