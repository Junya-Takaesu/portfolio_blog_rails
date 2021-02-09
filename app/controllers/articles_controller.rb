class ArticlesController < ApplicationController
  include Markdown::MarkdownParser
  DIR_ARTICLES = "/app/views/articles/"

  def about
  end

  def index
    @articles = Articles::List.new
  end

  def show
    @article = Articles::List.new.get_by(id: params[:id].to_i)
    @article = Articles::Article.new(id: @article[:id], title: @article[:title], article_path: @article[:article_path])
  end
end
