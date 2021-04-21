class ArticlesController < ApplicationController

  ArticlesList = Articles::List

  def index
    key = params[:key].nil? ? "created_at" : params[:key]
    order = params[:order].nil? ? "desc" : params[:order]

    articles_list = ArticlesList.new

    @articles = articles_list.sort(key: key, order: order).all
    @tags = articles_list.tags
  end

  def show
    articles_list = ArticlesList.new
    @article = articles_list.all[params[:id].to_i]
  end
end
