class StaticArticlesController < ApplicationController
  before_action :set_atricles

  def about
  end

  def index
  end

  def show
    @article = @articles[params[:id].to_i-1]
  end

  private
    def set_atricles
      @articles = [
        {id: 1, title: "初めての記事", hero_image: "hero-article1.jpg"},
        {id: 2, title: "Webpack と CDN の比較", hero_image: "hero-article2.png"},
        {id: 3, title: "Rails のレンダリングについて (View の表示)", hero_image: "hero-article3.jpg"},
        {id: 4, title: "コードスニペットをブログに取り入れる", hero_image: "markus-spiske-cvBBO4PzWPg-unsplash.jpg"},
        {id: 5, title: "画面の幅がブレイクポイントに達したら、レイアウトを変える", hero_image: "ezgif-3-3463b321f157.gif"},
        {id: 6, title: "ruby で、postgresql のテーブルを検索するやり方", hero_image: "luke-chesser-JKUTrJ4vK00-unsplash.jpg"},
        {id: 7, title: "bootstrap 5 の justify-content utilities を使う", hero_image: "bootstrap.jpg"},
      ]
    end
end
