require "json"

class Articles::List


  def initialize
    articles_json_parsed = JSON.parse(File.read("#{Rails.root}/app/views/articles/articles.json"))
    articles_array = articles_json_parsed.map do |key, value|
      [key.to_i, Articles::Article.new(id: value["id"], title: value["title"], created_at: value["created_at"])]
    end

    @articles_hash = articles_array.to_h
    self
  end


end