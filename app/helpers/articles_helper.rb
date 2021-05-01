module ArticlesHelper
  include Markdown::MarkdownParser

  HTML_CLASS_DISABLED = "btn col-12 disabled"
  HTML_CLASS_ENABLED = "btn col-12"

  def generate_navigation_anchor(article: , direction:)

    link_label = "記事がありません"
    href = "#"
    class_attributes = HTML_CLASS_DISABLED

    if direction == "prev"
      previous_article = article.previous_article
      if previous_article
        link_label = "<<< 前の記事: #{previous_article.created_at} #{previous_article.title}"
        href = previous_article.id.to_s
        class_attributes = HTML_CLASS_ENABLED
      end
    elsif direction == "next"
      next_article = article.next_article
      if next_article
        link_label = "#{next_article.created_at} #{next_article.title} :次の記事 >>>"
        href = next_article.id.to_s
        class_attributes = HTML_CLASS_ENABLED
      end
    end

    link_to link_label, href, class: class_attributes, role: "button"
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

  private

    def resolve_image_path(source)
      "#{request.path.split("/").last}/#{source}"
    end
end
