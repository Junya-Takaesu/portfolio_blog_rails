class Articles::Article
  include Markdown::MarkdownParser
  attr_reader :id, :title, :created_at, :tags, :is_published

  Id = "id"
  Title = "title"
  CreatedAt = "created_at"
  Tags = "tags"
  IsPublished = "is_published"
  Properties = [
    Id,
    Title,
    CreatedAt,
    Tags,
    IsPublished
  ]
  ArticlesList = Articles::List
  ARTICLES_VIEW_FILE_PATH = "#{Rails.root.to_s}/app/views/articles"

  def initialize(id:, title:, created_at:, tags:, is_published:)
    @id = id
    @title = title
    @created_at = Date.parse created_at
    @tags = tags
    @is_published = is_published
  end

  def save
    json_path = "#{ARTICLES_VIEW_FILE_PATH}/articles.json"
    json = File.read json_path
    parsed_json = JSON.parse json
    
    new_id = parsed_json.length+1
    today = Date.today.iso8601
    new_entry = [@id, @title, @created_at, @tags, @is_published]
    parsed_json[new_id.to_s] = Properties.zip(new_entry).to_h
    
    File.write json_path, JSON.pretty_generate(parsed_json)
    
    new_file = "#{ARTICLES_VIEW_FILE_PATH}/markdowns/_#{new_id}.md.erb"
    File.write new_file, ""
    
    @file_name = new_file
  end

  def previous_article
    article_list = ArticlesList.new

    previous_id = @id - 1
    while article_list.all[previous_id]
      return article_list.all[previous_id] if article_list.all[previous_id].is_published
      previous_id -= 1
    end

    false
  end

  def next_article
    article_list = ArticlesList.new

    next_id = @id + 1
    while article_list.all[next_id]
      return article_list.all[next_id] if article_list.all[next_id].is_published
      next_id += 1
    end

    false
  end

  def to_h
    hash = {
      "id" => @id,
      "title" => @title,
      "created_at" => @created_at,
      "tags" => @tags,
      "is_published" => @is_published
    }
  end

  def images
    return @images if @images
    markdown_file = File.read("#{Rails.root}/app/views/articles/markdowns/_#{@id}.md.erb")
    html = parse_markdown(string: markdown_file)
    document = Nokogiri::HTML.parse(html)
    @images = document.css("img").map {|img| img[:src]}
  end
end