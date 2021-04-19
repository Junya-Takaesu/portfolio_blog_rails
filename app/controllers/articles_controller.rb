class ArticlesController < ApplicationController
  def index
    key = params[:key].nil? ? "created_at" : params[:key]
    order = params[:order].nil? ? "desc" : params[:order]

    articles_list = Articles::List.new
    @articles = articles_list.sort(key: key, order: order).articles_hash
  end

  def show
    articles_list = Articles::List.new
    @article = articles_list.articles_hash[params[:id].to_i]
  end
end
