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


# Twitter の投稿埋め込み（API不要）
<blockquote class="twitter-tweet">
  <a href="https://twitter.com/ユーザー名/status/ツイートID"></a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


# Slimでのコメントアウト方法
/ これは Slim 上のコメント
/- Ruby 的にも無視したいコードのとき


# バリデーションのエラーメッセージ翻訳
ja:
  activerecord:
    errors:
      models:
        article:
          attributes:
            eye_catch_width:
              greater_than: "は100以上にしてください"