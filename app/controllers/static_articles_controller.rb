class StaticArticlesController < ApplicationController
  before_action :set_atricles

  def about
  end

  def index
  end

  def show
    @article = @articles[params[:id].to_i-1]
  end

  def bugs
  end

  private
    def set_atricles
      @articles = [
        {id: 1, title: "初めての記事", hero_image: "1/hero-article1.jpg"},
        {id: 2, title: "Webpack と CDN の比較", hero_image: "2/hero-article2.png"},
        {id: 3, title: "Rails のレンダリングについて (View の表示)", hero_image: "3/hero-article3.jpg"},
        {id: 4, title: "コードスニペットをブログに取り入れる", hero_image: "4/markus-spiske-cvBBO4PzWPg-unsplash.jpg"},
        {id: 5, title: "画面の幅がブレイクポイントに達したら、レイアウトを変える", hero_image: "5/ezgif-3-3463b321f157.gif"},
        {id: 6, title: "ruby で、postgresql のテーブルを検索するやり方", hero_image: "6/luke-chesser-JKUTrJ4vK00-unsplash.jpg"},
        {id: 7, title: "bootstrap 5 の justify-content utilities を使う", hero_image: "7/bootstrap.jpg"},
        {id: 8, title: "CSS練習(flex-box, 背景画像の設定, 疑似要素による明るさ設定)", hero_image: "8/flex-box-practice.jpg"},
      ]
    end
end
