class ArticlesController < ApplicationController
  def about
  end

  def index
    @articles = Articles::List.reverse
  end

  def show
    @article = Articles::List::ARTICLES_BY_ID[params[:id].to_i]
  end
end
