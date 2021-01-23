class StaticArticlesController < ApplicationController
  def about
  end

  def index
    @articles = [
      {id: 1, title: "初めての記事"},
      {id: 2, title: "Webpack と CDN の比較"}
    ]
  end

  def show
    render "article#{params[:id]}"
  end
end
