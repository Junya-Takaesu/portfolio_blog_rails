require "json"

class Articles::List

  attr_reader :articles_hash, :tags

  Order = ["asc", "desc"]

  def initialize
    articles_json_parsed = JSON.parse(File.read("#{Rails.root}/app/views/articles/articles.json"))
    articles_array = articles_json_parsed.map do |key, value|
      [key.to_i, Articles::Article.new(id: value["id"], title: value["title"], created_at: value["created_at"], tags: value["tags"])]
    end

    @articles_hash = articles_array.to_h
    @tags = get_tags
    self
  end

  def sort(key: "created_at", order: "desc")
    if !Articles::Article::Properties.include?(key) || !Order.include?(order)
      key = "created_at"
      order = "desc"
    end

    @articles_hash = @articles_hash.sort_by {|k, article| article.to_h[key]}

    @articles_hash.reverse! if order == "desc"
    self
  end

  private

    def get_tags
      tags = []
      @articles_hash.each do |index, article_hash|
        tags += article_hash.tags
      end
      tags.uniq.sort
    end

end