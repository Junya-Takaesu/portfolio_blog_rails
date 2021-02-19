class Articles::List
  ARTICLES_BY_ID = {
    1 => Articles::Article.new(id: 1, title: "21/1/30 初めての記事", article_path: "article1.md.erb"),
    2 => Articles::Article.new(id: 2, title: "21/1/31 Webpack と CDN の比較", article_path: "article2.md.erb"),
    3 => Articles::Article.new(id: 3, title: "21/2/1 Rails のレンダリングについて (View の表示)", article_path: "article3.md.erb"),
    4 => Articles::Article.new(id: 4, title: "21/2/2 コードスニペットをブログに取り入れる", article_path: "article4.md.erb"),
    5 => Articles::Article.new(id: 5, title: "21/2/3 画面の幅がブレイクポイントに達したら、レイアウトを変える", article_path: "article5.md.erb"),
    6 => Articles::Article.new(id: 6, title: "21/2/4 ruby で、postgresql のテーブルを検索するやり方", article_path: "article6.md.erb"),
    7 => Articles::Article.new(id: 7, title: "21/2/5 bootstrap 5 の justify-content utilities を使う", article_path: "article7.md.erb"),
    8 => Articles::Article.new(id: 8, title: "21/2/6 CSS練習(flex-box, 背景画像の設定, 疑似要素による明るさ設定)", article_path: "article8.md.erb"),
    9 => Articles::Article.new(id: 9, title: "21/2/7 markdown ブログを書き始める。", article_path: "article9.md.erb"),
    10 => Articles::Article.new(id: 10, title: "21/2/8 ダーツバーのウェブサイトを作成(練習)", article_path: "article10.md.erb"),
    11 => Articles::Article.new(id: 11, title: "21/2/9 配列と、ハッシュでは計算量に差が出る。", article_path: "article11.md.erb"),
    12 => Articles::Article.new(id: 12, title: "21/2/10 Sass変数が未定義になってしまう", article_path: "article12.md.erb"),
    13 => Articles::Article.new(id: 13, title: "21/2/10 sinatora で get と post 以外の http メソッドを扱う", article_path: "article13.md.erb"),
    14 => Articles::Article.new(id: 14, title: "21/2/10 コードハイライトを導入してみる", article_path: "article14.md.erb"),
    15 => Articles::Article.new(id: 15, title: "21/2/10 Turbolinks は 最初にサイトにアクセスしたときしか load イベントを発しない", article_path: "article15.md.erb"),
    16 => Articles::Article.new(id: 16, title: "21/2/12 css ファイルサイズを意識する", article_path: "article16.md.erb"),
    17 => Articles::Article.new(id: 17, title: "21/2/12 vscode 拡張機能 \"Live Sass Compiler\"", article_path: "article17.md.erb"),
    18 => Articles::Article.new(id: 18, title: "21/2/13 Google の検索結果に表示されるようにしたい", article_path: "article18.md.erb"),
    19 => Articles::Article.new(id: 19, title: "21/2/14 Markdown のコードブロックを簡単に書けるようにする", article_path: "article19.md.erb"),
    20 => Articles::Article.new(id: 20, title: "21/2/15 このブログは Google のインデックスに登録されているのか", article_path: "article20.md.erb"),
    21 => Articles::Article.new(id: 21, title: "21/2/15 Bootstrap5に pl-* のようなクラスは存在しない", article_path: "article21.md.erb"),
    22 => Articles::Article.new(id: 22, title: "21/2/15 twitter の api を使ってみる", article_path: "article22.md.erb"),
    23 => Articles::Article.new(id: 23, title: "21/2/16 Ruby で HTTP セッションを使ういろいろな方法", article_path: "article23.md.erb"),
    24 => Articles::Article.new(id: 24, title: "21/2/17 Sinatra の Session について", article_path: "article24.md.erb"),
    25 => Articles::Article.new(id: 25, title: "21/2/18 PG gem の使い方で知ったこと 2点", article_path: "article25.md.erb"),
    26 => Articles::Article.new(id: 26, title: "21/2/19 CSS not 疑似クラス", article_path: "article26.md.erb"),
  }

  def initialize
  end

  def self.reverse
    ARTICLES_BY_ID.sort_by {|k, v| -k}
  end
end