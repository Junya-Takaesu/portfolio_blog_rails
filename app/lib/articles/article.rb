class Articles::Article
  attr_reader :id, :title, :created_at, :tags

  Properties = [
    "id", "title", "created_at"
  ]

  def initialize(id:, title:, created_at:, tags:)
    @id = id
    @title = title
    @created_at = Date.parse created_at
    @tags = tags
  end

  def previous_article
    return false if @id == 1
    article_list = Articles::List.new
    article_list.articles_hash[@id-1]
  end

  def next_article
    article_list = Articles::List.new
    return false if article_list.articles_hash.size <= @id
    article_list.articles_hash[@id+1]
  end

  def to_h
    hash = {
      "id" => @id,
      "title" => @title,
      "created_at" => @created_at
    }
  end

end