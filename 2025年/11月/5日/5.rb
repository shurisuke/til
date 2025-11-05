# YouTubeの埋め込みURL構造について
## Slimでの記述例
iframe width="560" height="315" src="https://www.youtube.com/embed/#{embed.identifier}" frameborder="0" allowfullscreen=true


# Twitter(X)の投稿をAPI不要で埋め込む方法
## Slimでの最小構成例
.embed-twitter
  blockquote.twitter-tweet
    a href="https://twitter.com/ユーザー名/status/ツイートID"
  script async=true src="https://platform.twitter.com/widgets.js" charset="utf-8"


# Font Awesomeのアイコン使用法
## Slimでの例
i.fa.fa-twitter


# JavaScriptの読み込み場所
= javascript_include_tag 'admin'
= javascript_include_tag 'https://platform.twitter.com/widgets.js', async: true, charset: 'utf-8'

