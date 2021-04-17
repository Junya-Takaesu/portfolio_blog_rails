class ArticlesController < ApplicationController
  def about
  end

  def index
    articles_list = Articles::List.new
    @articles = articles_list.sort(key: "created_at", order: "desc").articles_hash
  end

  def show
    articles_list = Articles::List.new
    @article = articles_list.articles_hash[params[:id].to_i]
  end
end
