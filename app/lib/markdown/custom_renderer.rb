class Markdown::CustomRenderer < Redcarpet::Render::HTML
  include ERB::Util

  # redcarpet の メソッドをオーバーライド
  # markdown の image を html の img に変換するときに、
  # 任意の class 属性を設定できるようにした。結局使わないが、将来のために残しておく。
  def image(link, title, alt_text)
    %(<img src="#{link}" class="img-fluid">)
  end

  # code は ``` でくくられたコードが入ってくる。
  # language は ``` で指定された言語が入ってくる。
  # 行番号表示を有効にするには <pre class="language-ruby line-numbers"> のように、
  # line-numbers というクラスを追加する必要があるので、markdown 側では下記の様に書く必要がある。
  #
  # ```language-ruby.line-numbers <- ドットつなぎで言語と行番号のクラスを指定する
  #   some codes ...
  # ```
  def block_code(code, language)
    class_list = language.nil? ? "language-none" : ((language.split ".").join " ")
    %(
<pre><code class="#{class_list}">#{html_escape code}</code></pre>
    )
  end

  def codespan(code)
    %(<code class="language-none" style="margin-left: 2px; margin-right: 2px;">#{code}</code>)
  end
end