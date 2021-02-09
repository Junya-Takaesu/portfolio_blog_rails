class Markdown::CustomRenderer < Redcarpet::Render::HTML

  # redcarpet の メソッドをオーバーライド
  # markdown の image を html の img に変換するときに、
  # 任意の class 属性を設定できるようにした。結局使わないが、将来のために残しておく。
  def image(link, title, alt_text)
    %(<img src="#{link}" class="img-fluid">)
  end
end