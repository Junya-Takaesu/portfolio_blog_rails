class StaticArticlesController < ApplicationController
  def about
  end

  def index
    @articles = [
      {id: 1, title: "初めての記事"}
    ]
  end

  def show
    render "article#{params[:id]}"
  end
end
