class Articles::Article
  attr_reader :id, :title

  def initialize(id:, title:)
    @id = id
    @title = title
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