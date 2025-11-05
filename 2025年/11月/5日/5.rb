# YouTubeの埋め込みURL構造について
## Slimでの記述例
iframe width="560" height="315" src="https://www.youtube.com/embed/#{embed.identifier}" frameborder="0" allowfullscreen=true


# Twitter(X)の投稿をAPI不要で埋め込む方法
## Slimでの最小構成例
.embed-twitter
  blockquote.twitter-tweet
    a href="https://twitter.com/ユーザー名/status/ツイートID"
  script async=true src="https://platform.twitter.com/widgets.js" charset="utf-8"