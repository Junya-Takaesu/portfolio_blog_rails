require "json"

class Articles::List


  articles = JSON.parse(File.read("#{Rails.root}/app/views/articles/articles.json"))
  articles_array = articles.map do |key, value|
    [key.to_i, Articles::Article.new(id: value["id"], title: value["title"], created_at: value["created_at"])]
  end

  ARTICLES_BY_ID = articles_array.to_h

  def initialize
  end

  def self.reverse
    (ARTICLES_BY_ID.sort_by {|k, v| -k}).to_h
  end
end