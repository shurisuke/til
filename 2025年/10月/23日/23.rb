# コード例
### scope の定義

scope :viewable, -> { published.where('published_at < ?', Time.current) }


## Ruby on RailsのPolymorphic関連を復習

- `polymorphic: true` を使うと、1つの関連から複数の異なるモデルを扱える（例: `Sentence`, `Medium`, `Embed`）。
- これにより、`article_block.blockable` で、実際の関連先（Sentenceなど）を1つのインターフェースで扱える。
- `blockable_type` と `blockable_id` が自動で生成され、Railsが正しいモデルとデータを判断してくれる。

## ビルドメソッドでHTMLを構築する仕組み

- `Article#build_body(controller)` メソッドでは、記事に関連する `article_blocks` を順に処理。
- `sentence?`, `medium?`, `embed?` メソッドを使って、各 `blockable` の型を判定。
- `render_to_string` により、各ブロックのHTMLパーシャルを描画せずにHTML文字列として取得・連結している。

## ActiveDecoratorの利用

- `ActiveDecorator::Decorator.instance.decorate(...)` でblockableをデコレーターとしてラップし、拡張された表示用メソッドを使えるようにしている。

## nilガードと安全なview描画

- `.present?` でnilや空データを弾く処理を導入。
- `- if medium.image_url(:lg).present?` のようなguard文を通して、エラーのない画像表示処理を実現。