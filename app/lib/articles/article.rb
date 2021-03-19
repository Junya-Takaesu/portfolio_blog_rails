class Articles::Article
  attr_reader :id, :title, :created_at

  def initialize(id:, title:, created_at:)
    @id = id
    @title = title
    @created_at = created_at
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