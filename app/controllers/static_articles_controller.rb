class StaticArticlesController < ApplicationController
  include MarkdownParser
  DIR_ARTICLES = "/app/views/static_articles/"
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
        {id: 1, title: "初めての記事", hero_image: "1/hero-article1.jpg", article_path: "article1.md.erb"},
        {id: 2, title: "Webpack と CDN の比較", hero_image: "2/hero-article2.png", article_path: "article2.md.erb"},
        {id: 3, title: "Rails のレンダリングについて (View の表示)", hero_image: "3/hero-article3.jpg", article_path: "article3.md.erb"},
        {id: 4, title: "コードスニペットをブログに取り入れる", hero_image: "4/markus-spiske-cvBBO4PzWPg-unsplash.jpg", article_path: "article4.md.erb"},
        {id: 5, title: "画面の幅がブレイクポイントに達したら、レイアウトを変える", hero_image: "5/ezgif-3-3463b321f157.gif", article_path: "article5.md.erb"},
        {id: 6, title: "ruby で、postgresql のテーブルを検索するやり方", hero_image: "6/luke-chesser-JKUTrJ4vK00-unsplash.jpg", article_path: "article6.md.erb"},
        {id: 7, title: "bootstrap 5 の justify-content utilities を使う", hero_image: "7/bootstrap.jpg", article_path: "article7.md.erb"},
        {id: 8, title: "CSS練習(flex-box, 背景画像の設定, 疑似要素による明るさ設定)", hero_image: "8/flex-box-practice.jpg", article_path: "article8.md.erb"},
        {id: 9, title: "markdown ブログを書き始める。", hero_image: "9/markdown-logo.jpg", article_path: "article9.md.erb"},
        {id: 10, title: "ダーツバーのウェブサイトを作成(練習)", hero_image: "10/saba-sand.gif", article_path: "article10.md.erb"},
        {id: 11, title: "配列と、ハッシュでは計算量に差が出る。", hero_image: "10/saba-sand.gif", article_path: "article11.md.erb"},
        {id: 12, title: "Sass変数が未定義になってしまう", hero_image: "10/saba-sand.gif", article_path: "article12.md.erb"},
      ]
    end
end
