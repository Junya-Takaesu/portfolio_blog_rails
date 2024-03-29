module Markdown::MarkdownParser
  def parse_markdown(
    string: "",
    escape_html: true,
    hard_wrap: true,
    with_toc_data: true,
    link_attributes: {target: "_blank"},
    no_intra_emphasis: true,
    autolink: true,
    fenced_code_blocks: true,
    tables: true,
    underline: true,
    strikethrough: true,
    disable_indented_code_blocks: true,
    highlight: true,
    footnotes: true
  )
    return "" if string.empty?
    renderer = Markdown::CustomRenderer.new(
      render_options = {
        escape_html: escape_html,
        hard_wrap: hard_wrap,
        with_toc_data: with_toc_data,
        link_attributes: link_attributes,
      },
    )
    markdown = Redcarpet::Markdown.new(
      renderer,
      extensions = {
        no_intra_emphasis: true,
        autolink: autolink,
        fenced_code_blocks: fenced_code_blocks,
        tables: tables,
        underline: underline,
        strikethrough: strikethrough,
        disable_indented_code_blocks: disable_indented_code_blocks,
        highlight: highlight,
        footnotes: footnotes,
      },
    )
    markdown.render(string)
  end
end