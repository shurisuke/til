

# simple_form_forでのラジオボタン実装方法
= f.input :eye_catch_send, as: :radio_buttons,
  collection: Article.eye_catch_sends.keys.map { |key| [Article.human_attribute_name("eye_catch_send.#{key}"), key] },
  include_blank: false