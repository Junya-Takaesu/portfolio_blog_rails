require "json"

class Articles::List

  attr_reader :all, :tags

  Order = ["asc", "desc"]
  Article = Articles::Article

  def initialize
    articles_json_parsed = JSON.parse(File.read("#{Rails.root}/app/views/articles/articles.json"))
    articles_array = articles_json_parsed.map do |key, value|
      [key.to_i, Article.new(id: value["id"], title: value["title"], created_at: value["created_at"], tags: value["tags"])]
    end

    @all = articles_array.to_h
    @tags = get_tags
    self
  end


  def sort(sort_key: "created_at", order: "desc")
    if !Article::Properties.include?(sort_key) || !Order.include?(order)
      sort_key = "created_at"
      order = "desc"
    end

    @all = @all.sort_by {|k, article| article.to_h[sort_key]}

    @all.reverse! if order == "desc"
    self
  end

  private

    def get_tags
      tags = []
      @all.each do |index, article_hash|
        tags += article_hash.tags
      end
      tags.uniq.sort
    end

end