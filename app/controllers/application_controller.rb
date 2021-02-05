class ApplicationController < ActionController::Base
  helper_method :parse_markdown

  def perse_markdown(
    file_path: "",
    escape_html: true,
    hard_wrap: true,
    with_toc_data: true,
    link_attributes: {target: "_blank"},
    autolink: true,
    fenced_code_blocks: true,
    tables: true,
    underline: true,
    strikethrough: true,
    disable_indented_code_blocks: true,
    highlight: true,
    footnotes: true
  )
    return "" if file_path.empty?
    renderer = Redcarpet::Render::HTML.new(
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
    markdown.render(File.read(file_path))
  end
end
