module MetaTagsHelper

  def description_meta_tag
    content = page_description
    "<meta name=\"description\" content=\"#{content}\">".html_safe
  end

  def json_ld_meta_tag
    json_ls = {
      "@context": "https://schema.org",
      "@type": "BlogPosting",
      "headline": page_description,
      "image": [
        "https://imgur.com/3P88u6M"
      ],
      "datePublished": "2021-01-01T00:00:00+09:00"
    }

    unless @article.nil?
      json_ls["datePublished"] = @article.created_at.to_time.to_s
    end

    %(
      <script type="application/ld+json">
        #{json_ls.to_json}
      </script>
    ).html_safe
  end

  def page_description

    case request.path
    when root_path
      content = "#{parse_markdown(string: (render "introduction.md.erb"), escape_html: false)}".html_safe
    when articles_path
      content = "Webプログラミングに関する備忘録、情報共有を目的とした内容の記事を発信しています。🙋‍♂️️"
    else
      content = "#{parse_markdown(string: (render "#{@article.id}.md.erb"), escape_html: false)}".html_safe
    end

    content = ActionView::Base.full_sanitizer.sanitize content
    content = content[0..150]
  end
end