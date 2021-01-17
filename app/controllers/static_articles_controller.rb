class StaticArticlesController < ApplicationController
  def index
    @articles = [
      {id: 1, title: "初めての記事"},
      {id: 2, title: "2番目の記事"}
    ]
  end

  def show
    render "pages/article#{params[:id]}"
  end
end
