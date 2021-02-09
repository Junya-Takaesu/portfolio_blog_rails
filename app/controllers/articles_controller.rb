class ArticlesController < ApplicationController
  include Markdown::MarkdownParser
  DIR_ARTICLES = "/app/views/articles/"
  before_action :set_atricles

  def about
  end

  def index
  end

  def show
    @articles.each_with_index {|article, index| @article = article if article[:id] == params[:id].to_i }
  end

  private
    def set_atricles
      # article_path は、Rails のルートからのパスを書く
      @articles = [
        {id: 1, title: "初めての記事", article_path: "article1.md.erb"},
        {id: 2, title: "Webpack と CDN の比較",article_path: "article2.md.erb"},
        {id: 3, title: "Rails のレンダリングについて (View の表示)",article_path: "article3.md.erb"},
        {id: 4, title: "コードスニペットをブログに取り入れる",article_path: "article4.md.erb"},
        {id: 5, title: "画面の幅がブレイクポイントに達したら、レイアウトを変える",article_path: "article5.md.erb"},
        {id: 6, title: "ruby で、postgresql のテーブルを検索するやり方",article_path: "article6.md.erb"},
        {id: 7, title: "bootstrap 5 の justify-content utilities を使う",article_path: "article7.md.erb"},
        {id: 8, title: "CSS練習(flex-box, 背景画像の設定, 疑似要素による明るさ設定)",article_path: "article8.md.erb"},
        {id: 9, title: "markdown ブログを書き始める。",article_path: "article9.md.erb"},
        {id: 10, title: "ダーツバーのウェブサイトを作成(練習)",article_path: "article10.md.erb"},
        {id: 11, title: "配列と、ハッシュでは計算量に差が出る。",article_path: "article11.md.erb"},
        {id: 12, title: "Sass変数が未定義になってしまう",article_path: "article12.md.erb"},
      ]
    end
end
