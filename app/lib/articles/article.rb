class Articles::Article
  attr_reader :id, :title, :article_path

  def initialize(id:, title:, article_path:)
    @id = id
    @title = title
    @article_path = article_path
  end

  def prev_id
    return false if @id == 1
    @id - 1
  end

  def next_id
    return false if @id == Articles::List.new.all.size
    @id + 1
  end
end