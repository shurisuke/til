# ① レイアウトファイルであるadmin.html.slimでyield 'scripts'として、scriptsスロットの表示場所を確保＆app/assets/javascripts/admin.jsの読み込み




# ② edit.html.slimでedit_article.jsの読み込み




# ③ app/javascript/edit_article.jsでapp/javascript/articleBlockEditor/index.jsの読み込み。




# ④ index.jsでモジュールの読み込みと jQuery プラグイン定義、描画対象のDOMを取得、textarea要素を取得、onChangeハンドラ定義、Reactコンポーネントを描画




# ⑤ js-article-block-formsクラスのオブジェクトに、ajaxでurlやmethod、datatypeを埋め込む。これがページがロードされるとすぐs-article-block-formsクラスのオブジェクトに実行されるので、ArticleBlocksController#index が実行




# ⑥ app/controller/admin/articles/article_block_controller#indexアクションが呼ばれ、@article_blocks 変数の用意をビューへ渡す。




# ⑦ views/admin/articles/article_blocks/index.html.slimで、admin/articles/article_blocks/insert_blockの描画と、@article_blocksの要素ごとにadmin/articles/article_blocks/article_blockとadmin/articles/article_blocks/insert_blockの描画を実行




# ⑧ admin/articles/article_blocks/insert_blockでは、ブロックを構築するをクリックした際に、動的なhtml要素をajaxを使って実行




# ⑨ admin/articles/article_blocks/article_blockでは個々の ArticleBlock を箱のように表示する UI を構築。js-article-block-content の中で、それぞれのブロックタイプ（sentence, medium, embed）に応じてパーシャルを切り替えて描画している。