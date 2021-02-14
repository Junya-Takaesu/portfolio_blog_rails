module ArticlesHelper
  include Markdown::MarkdownParser

  def generate_navigation_anchor(article: , direction:)
    class_attributes = "btn col-12"

    if direction == "prev" && article.prev_id
      link_label = "<<< 前の記事: #{article.title}"
      href = article.prev_id.to_s
    elsif direction == "next" && article.next_id
      link_label = "#{article.title} :次の記事 >>>"
      href = article.next_id.to_s
    else
      link_label = "記事がありません"
      href = "#"
      class_attributes = "btn col-12 disabled"
    end

    link_to link_label, href, class: class_attributes, role: "button"
  end
end
