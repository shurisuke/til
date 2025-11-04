# Simple Form での collection_radio_buttons の使い方

= f.collection_radio_buttons :eye_catch_send,
                              Article.eye_catch_sends_i18n,
                              :first,
                              :last


# ラジオボタンを縦並びにする方法

= f.collection_radio_buttons :eye_catch_send,
                              Article.eye_catch_sends_i18n,
                              :first,
                              :last,
                              item_wrapper_class: "d-block"


# content_tag の基本と使い所

content_tag(:iframe, nil,
  src: "https://www.youtube.com/embed/#{embed.identifier}",
  width: 560,
  height: 315,
  allowfullscreen: true
)