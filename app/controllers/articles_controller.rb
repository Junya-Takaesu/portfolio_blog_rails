class ArticlesController < ApplicationController
  before_action :set_title

  ArticlesList = Articles::List
  Article = Articles::Article

  def index
    sort_key = params[:sort_key].nil? ? "created_at" : params[:sort_key]
    order = params[:order].nil? ? "desc" : params[:order]
    @param_tags       = params[:tags].nil?       ? ""           : params[:tags]
    @param_created_at = params[:created_at].nil? ? ""           : params[:created_at]

    @param_tags = @param_tags.split(",")
    @param_created_at = @param_created_at.split(",").map {|year_month| "#{year_month}-01"}

    articles_list = ArticlesList.new

    @tags = articles_list.tags
    @dates = articles_list.dates.map {|date| "#{date.year}-#{date.month.to_s.rjust(2, "0")}"}.uniq
    @title = generate_title("記事一覧")

    if @param_tags.empty? && @param_created_at.empty?
      @articles = articles_list.sort(sort_key: sort_key, order: order).all
    else
      condition = {Article::CreatedAt => @param_created_at, Article::Tags => @param_tags}
      @articles = articles_list.filter(condition).sort(sort_key: sort_key, order: order).filtered
    end

    @param_created_at.map.with_index {|_date, index| @param_created_at[index] = _date[0..-4]}
  end

  def show
    articles_list = ArticlesList.new
    @article = articles_list.all[params[:id].to_i]
    redirect_to root_path unless @article.is_published

    @title = generate_title(@article.title)
  end
end
