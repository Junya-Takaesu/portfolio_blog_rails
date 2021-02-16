class Articles::Article
  attr_reader :id, :title, :article_path

  def initialize(id:, title:, article_path:)
    @id = id
    @title = title
    @article_path = article_path
  end

  def previous_article
    return false if @id == 1
    Articles::List::ARTICLES_BY_ID[@id-1]
  end

  def next_article
    return false if @id == Articles::List::ARTICLES_BY_ID.size
    Articles::List::ARTICLES_BY_ID[@id+1]
  end
end