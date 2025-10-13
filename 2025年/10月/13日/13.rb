# attr_accessor の役割

attr_accessor :title, :output, :action, :tag_name


# with_options を使ったバリデーション

with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :output, length: { maximum: 400 }
end


# initialize

def initialize(attributes = nil, article: Article.new)
    @article = article
    attributes ||= default_attributes
    super(attributes)
  end

#  •	@article = article
#  新規作成用の空オブジェクト、または編集対象の既存オブジェクトを保持する。
#      •	attributes ||= default_attributes
#  フォームから値が渡されていない場合（例：編集画面表示時）は、既存の値をフォーム初期値として反映する。
#      •	super(attributes)
#  attr_accessor によって定義された属性へ値をセットし、Formオブジェクト全体を初期化する。
#
#  この仕組みにより、create と update を同じ処理で扱えるようになる。
# また、編集画面で既存データを自動的にフォームへ反映させることができる。