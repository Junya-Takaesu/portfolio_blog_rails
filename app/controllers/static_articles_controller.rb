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
      ]
    end
end
