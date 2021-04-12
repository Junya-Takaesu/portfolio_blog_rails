class Markdown::CustomRenderer < Redcarpet::Render::HTML
  include ERB::Util

  # 引数 code は ``` でくくられたコードが入ってくる。
  # 引数 language は ``` の直後に指定された言語が入ってくる。
  # デフォルトの動作: <pre class="language-ruby line-numbers"> のようなタグを生成して、行番号を有効にする
  # 行番号を無効にするには、下記の属性を markdown で追加する
  #
  # ```ruby.no-line-numbers <- ドットつなぎで言語と、行番号無効の属性を指定する
  #   some codes ...
  # ```
  def block_code(code, language)
    language_type = "language-none"
    line_numbers = ""

    unless language.nil?
      language_params = language.split "."
      language_type = "language-#{language_params[0]}"
      line_numbers = "line-numbers" unless language_params[1] == "no-line-numbers"
    end

    class_list = "#{language_type} #{line_numbers}"
    %(
<pre><code class="#{class_list}">#{html_escape code}</code></pre>
    )
  end

  def codespan(code)
    %(<code class="language-none" style="margin-left: 2px; margin-right: 2px;">#{code}</code>)
  end
end