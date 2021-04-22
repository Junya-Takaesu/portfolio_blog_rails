require "json"

class Articles::List

  attr_reader :all, :filtered, :tags

  Order = ["asc", "desc"]
  Article = Articles::Article
  CreatedAt = Article::CreatedAt
  Tags = Article::Tags

  def initialize
    articles_json_parsed = JSON.parse(File.read("#{Rails.root}/app/views/articles/articles.json"))
    articles_array = articles_json_parsed.map do |key, value|
      [key.to_i, Article.new(id: value["id"], title: value["title"], created_at: value["created_at"], tags: value["tags"])]
    end

    @all = articles_array.to_h
    @filtered = {}
    @tags = get_tags
    @last_called_method = __method__
    self
  end

  def filter(condition = {})
    filtered_by = {
      CreatedAt => {},
      Tags => {}
    }

    condition.each do |key, value|
      case key
      when CreatedAt
        param_created_at = value
        param_created_at.each do |_param_created_at|
          _filtered_by_created_at = @all.select do |_key, _article|
            _article.to_h[CreatedAt].month == Date.parse(_param_created_at.strip).month
          end
          filtered_by[CreatedAt].merge!(_filtered_by_created_at)
        end
      when Tags
        article_keys_filtered_by_tags = []
        common_articles_indexes = []
        param_tags = value

        param_tags.each_with_index do |_param_tag, _index|
          _filtered_by_tag = @all.select do |_key, _article|
            _article.to_h[Tags].include?(_param_tag.strip)
          end
          article_keys_filtered_by_tags.append(_filtered_by_tag.keys)
        end

        if 0 < param_tags.size
          common_articles_indexes = article_keys_filtered_by_tags.first
          article_keys_filtered_by_tags.each_with_index do |_indexes, _index|
            common_articles_indexes = common_articles_indexes & _indexes
          end
        end

        filtered_by[Tags] = @all.select {|_index, _article| common_articles_indexes.include?(_index)}
      else
        return self
      end
    end

    is_created_at_given = !condition[CreatedAt].empty?
    is_tags_given = !condition[Tags].empty?

    if !is_tags_given && is_created_at_given
      @filtered = filtered_by[CreatedAt]
    elsif is_tags_given && !is_created_at_given
      @filtered = filtered_by[Tags]
    elsif is_tags_given && is_created_at_given
      result_keys = filtered_by[CreatedAt].keys & filtered_by[Tags].keys
      @filtered = @all.select {|_index, _article| result_keys.include?(_index)}
    end

    @last_called_method = __method__
    self
  end

  def sort(sort_key: "created_at", order: "desc")
    if !Article::Properties.include?(sort_key) || !Order.include?(order)
      sort_key = "created_at"
      order = "desc"
    end

    @all = @all.sort_by {|k, article| article.to_h[sort_key]}

    @last_called_method = __method__
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