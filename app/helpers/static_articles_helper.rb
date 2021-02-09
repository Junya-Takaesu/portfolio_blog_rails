module StaticArticlesHelper
include MarkdownParser

  def generate_navigation_anchor(articles, current_article_id, direction)
    directions = {prev: -1, next: 1}

    # articles を総当りで見ているので、計算量が多い
    article = articles.select {|article| article[:id] == (current_article_id + directions[direction.to_sym])}

    if article.empty?
      link_label = "記事がありません"
      href = "#"
      link_to link_label, href, class: "btn btn-outline-secondary col-12 disabled"
    else
      if direction == "prev"
        link_label = "<<< 前の記事: #{article[0][:title]}"
      else
        link_label = "#{article[0][:title]} :次の記事 >>>"
      end
      href = article[0][:id].to_s
      link_to link_label, href, class: "btn btn-outline-warning col-12", role: "button"
    end
  end
end
