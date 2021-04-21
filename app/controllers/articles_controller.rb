class ArticlesController < ApplicationController
  def index
    key = params[:key].nil? ? "created_at" : params[:key]
    order = params[:order].nil? ? "desc" : params[:order]

    articles_list = Articles::List.new
    @articles = articles_list.sort(key: key, order: order).all
    @tags = articles_list.tags
  end

  def show
    articles_list = Articles::List.new
    @article = articles_list.all[params[:id].to_i]
  end
end
