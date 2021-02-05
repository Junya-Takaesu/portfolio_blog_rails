class StaticArticlesController < ApplicationController
  DIR_ARTICLES = "/app/views/static_articles/"
  before_action :set_atricles

  def about
  end

  def index
  end

  def show
    @articles.each_with_index {|article, index| @article = article if article[:id] == params[:id].to_i }
    @html = perse_markdown(file_path: Rails.root.to_s + DIR_ARTICLES + @article[:article_path])
  end

  private
    def set_atricles
      # article_path は、Rails のルートからのパスを書く
      @articles = [
        {id: 1, title: "初めての記事", hero_image: "1/hero-article1.jpg", article_path: "article1.md"},
        {id: 2, title: "Webpack と CDN の比較", hero_image: "2/hero-article2.png", article_path: "article2.md"},
        {id: 3, title: "Rails のレンダリングについて (View の表示)", hero_image: "3/hero-article3.jpg", article_path: "article3.md"},
        {id: 4, title: "コードスニペットをブログに取り入れる", hero_image: "4/markus-spiske-cvBBO4PzWPg-unsplash.jpg", article_path: "article4.md"},
        {id: 5, title: "画面の幅がブレイクポイントに達したら、レイアウトを変える", hero_image: "5/ezgif-3-3463b321f157.gif", article_path: "article5.md"},
        {id: 6, title: "ruby で、postgresql のテーブルを検索するやり方", hero_image: "6/luke-chesser-JKUTrJ4vK00-unsplash.jpg", article_path: "article6.md"},
        {id: 7, title: "bootstrap 5 の justify-content utilities を使う", hero_image: "7/bootstrap.jpg", article_path: "article7.md"},
        {id: 8, title: "CSS練習(flex-box, 背景画像の設定, 疑似要素による明るさ設定)", hero_image: "8/flex-box-practice.jpg", article_path: "article8.md"},
        {id: 9, title: "markdown ブログを書き始める。", hero_image: "9/markdown-logo.jpg", article_path: "article9.md"},
      ]
    end
end
