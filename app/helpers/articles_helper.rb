module ArticlesHelper
  include Markdown::MarkdownParser

  HTML_CLASS_DISABLED = "btn col-12 disabled"
  HTML_CLASS_ENABLED = "btn col-12 shadow-lg rounded border border-3"

  def generate_navigation_anchor(article: , direction:)

    link_label = "記事がありません"
    href = "#"
    class_attributes = HTML_CLASS_DISABLED

    if direction == "prev"
      previous_article = article.previous_article
      if previous_article
        link_label = "前の記事 <br> #{previous_article.created_at} <br> #{previous_article.title}"
        href = previous_article.id.to_s
        class_attributes = HTML_CLASS_ENABLED
      end
    elsif direction == "next"
      next_article = article.next_article
      if next_article
        link_label = "次の記事 <br> #{next_article.created_at} <br> #{next_article.title}"
        href = next_article.id.to_s
        class_attributes = HTML_CLASS_ENABLED
      end
    end

    link_to link_label.html_safe, href, class: class_attributes, role: "button"
  end

  # Monkey-patch to simplify  addition of image to articles
  # Official image_tag api document is below:
  #  https://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#method-i-image_tag
  def image_tag(source, options = {})
    source = resolve_image_path(source) unless options[:prevent_resolve_path]
    super(source, options)
  end

  def to_japanese_date(date)
    "#{date.year}年 #{date.month}月 #{date.day}日"
  end

  # Check these links for available icons:
  # https://devicon.dev/
  # https://fontawesome.com/
  # https://ionicons.com/
  def icon(type)
    icon = ""
    type = type.downcase

    case type
    when "css"
      icon = '<i class="devicon-css3-plain"></i>'
    when "windows"
      icon = '<i class="devicon-windows8-original"></i>'
    when "sql"
      icon = '<i class="fas fa-database"></i>'
    when "markdown"
      icon = '<ion-icon name="logo-markdown"></ion-icon>'
    when "vscode"
      icon = '<i class="devicon-visualstudio-plain"></i>'
    else
      type = "javascript" if type.include? ".js"
      icon = "<i class=\"devicon-#{type}-plain\"></i>"
    end
    icon.html_safe
  end

  def advertising_anchors(articles_tags)
    ad_types = ["ruby", "php", "python","javascript", "ruby on rails", "css", "linux", "docker", "react.js", "vue.js", "node.js"]
    match = false
    articles_tags.each {|tag| match = true if ad_types.include? tag}
    if match
      while true
        type = articles_tags.sample
        if ad_types.include? type
          return "articles/ad_snippets/#{type}.html"
        end
      end
    else
      return "articles/ad_snippets/#{ad_types.sample}.html"
    end
  end

  private

    def resolve_image_path(source)
      "#{request.path.split("/").last}/#{source}"
    end
end
