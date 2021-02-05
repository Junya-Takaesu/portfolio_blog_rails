class StaticArticlesController < ApplicationController
  before_action :set_atricles

  def about
  end

  def index
  end

  def show
    @articles.each_with_index {|article, index| @article = article if article[:id] == params[:id].to_i }
    @html = perse_markdown(file_path: Rails.root.to_s + @article[:article_path])
  end

  private
    def set_atricles
      # article_path は、Rails のルートからのパスを書く
      @articles = [
        {id: 1, hero_image: "1/hero-article1.jpg", article_path: "/app/views/static_articles/article1.md"},
        {id: 2, hero_image: "2/hero-article2.png", article_path: "/app/views/static_articles/article2.md"},
        {id: 3, hero_image: "3/hero-article3.jpg", article_path: "/app/views/static_articles/article3.md"},
        {id: 4, hero_image: "4/markus-spiske-cvBBO4PzWPg-unsplash.jpg", article_path: "/app/views/static_articles/article4.md"},
        {id: 5, hero_image: "5/ezgif-3-3463b321f157.gif", article_path: "/app/views/static_articles/article5.md"},
        {id: 6, hero_image: "6/luke-chesser-JKUTrJ4vK00-unsplash.jpg", article_path: "/app/views/static_articles/article6.md"},
        {id: 7, hero_image: "7/bootstrap.jpg", article_path: "/app/views/static_articles/article7.md"},
        {id: 8, hero_image: "8/flex-box-practice.jpg", article_path: "/app/views/static_articles/article8.md"},
        {id: 9, hero_image: "9/saba-sand.gif", article_path: "/app/views/static_articles/article9.md"},
      ]
    end
end
