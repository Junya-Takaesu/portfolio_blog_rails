class ArticlesController < ApplicationController

  ArticlesList = Articles::List

  def index
    sort_key = params[:sort_key].nil? ? "created_at" : params[:sort_key]
    order = params[:order].nil? ? "desc" : params[:order]

    articles_list = ArticlesList.new

    @articles = articles_list.sort(sort_key: sort_key, order: order).all
    @tags = articles_list.tags
  end

  def show
    articles_list = ArticlesList.new
    @article = articles_list.all[params[:id].to_i]
  end
end
