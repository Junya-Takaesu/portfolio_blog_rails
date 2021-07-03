class Markdown::CustomRenderer < Redcarpet::Render::HTML
  include ERB::Util

  # 引数 code は ``` でくくられたコードが入ってくる。
  # 引数 language は ``` の直後に指定された言語が入ってくる。
  # デフォルトの動作: <pre class="language-ruby line-numbers"> のようなタグを生成して、行番号を有効にする
  # ただし、行番号は表示がソースコードとずれるので使わない
  def block_code(code, language)
    language_type = language.nil? ? "language-none" : "language-#{language}"
    %(
<pre><code class="#{language_type}">#{html_escape code}</code></pre>
    )
  end

  def codespan(code)
    %(<code class="language-none">#{code}</code>)
  end
end