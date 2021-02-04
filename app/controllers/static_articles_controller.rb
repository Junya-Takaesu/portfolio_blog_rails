class StaticArticlesController < ApplicationController
  before_action :set_atricles

  def about
  end

  def index
  end

  def show
    @articles.each_with_index {|article, index| @article = article if article[:id] == params[:id].to_i }
    @html = perse_markdown(file_path: "#{Rails.root}/app/views/static_articles/article#{params[:id].to_i}.md")
  end

  private
    def set_atricles
      @articles = [
        {id: 1, hero_image: "1/hero-article1.jpg"},
        {id: 2, hero_image: "2/hero-article2.png"},
        {id: 3, hero_image: "3/hero-article3.jpg"},
        {id: 4, hero_image: "4/markus-spiske-cvBBO4PzWPg-unsplash.jpg"},
        {id: 5, hero_image: "5/ezgif-3-3463b321f157.gif"},
        {id: 6, hero_image: "6/luke-chesser-JKUTrJ4vK00-unsplash.jpg"},
        {id: 7, hero_image: "7/bootstrap.jpg"},
        {id: 8, hero_image: "8/flex-box-practice.jpg"},
        {id: 9, hero_image: "9/saba-sand.gif"},
      ]
    end
end
