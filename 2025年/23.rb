# コード例
### scope の定義

scope :viewable, -> { published.where('published_at < ?', Time.current) }