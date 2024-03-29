module MetaTagsHelper

  def description_meta_tag
    content = page_description
    "<meta name=\"description\" content=\"#{content}\">".html_safe
  end

  def json_ld_meta_tag
    return unless /\/articles\/\d+\z/.match(request.path)
    json_ls = {
      "@context": "https://schema.org",
      "@type": "BlogPosting",
      "headline": @article.title,
      "image": [
        "https://i.imgur.com/3P88u6M.jpg"
      ],
      "datePublished": @article.created_at.to_time.strftime('%Y-%m-%dT%H:%M:%S%:z')
    }

    if @article.images && !@article.images.empty?
      json_ls[:image] = @article.images
    end

    %(
      <script type="application/ld+json">
        #{json_ls.to_json}
      </script>
    ).html_safe
  end

  def page_description

    case request.path
    when about_path
      content = "#{parse_markdown(string: (render "introduction.md.erb"), escape_html: false)}".html_safe
    when root_path
      content = "#{parse_markdown(string: (render "synopsis.md.erb"), escape_html: false)}".html_safe
    else
      content = "#{parse_markdown(string: (render "articles/markdowns/#{@article.id}.md.erb"), escape_html: false)}".html_safe
    end

    content = ActionView::Base.full_sanitizer.sanitize content
    content = content[0..150]
  end
end