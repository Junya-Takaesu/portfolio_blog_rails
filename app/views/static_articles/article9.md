## HTMLでブログを書くのは疲れる。
ブログの記事を最初は直接htmlで書いていました。
ヘッダーやレイアウトなどは、`Rails` のテンプレートの仕組みを使っているので、実際に `html` で書くのは `p` タグで段落分けたり、
`ul` , `li` を使って、箇条書きを作る程度でした。[^3]
しかし、それでもやっぱり `html` で書くのは面倒になってきたので、 `markdown` で書くことにしました。
実際にこの文章も `markdown` で書いています。

https://qiita.com/oreo/items/82183bfbaac69971917f


[^1]: ここにいろいろ書いてみよう http://example.com
[^2]: ~~ここにいろいろ書いてみよう~~ ２回めも書いてみよう
[^3]: `[^n]` と本文中に書いて、footnotes には `[^n]: hogehoge` と書くよ

https://github.com/vmg/redcarpet
a699c82
on 16 Dec 2020
Git stats

* Markdown オブジェクトの生成のオプションに autolink: true をつけると、url が アンカータグに変換される。

[Qiita](http://qiita.com)

escape_html: true, を 使うと、<h2>HTML タグはエスケープされる。</h2>
filter_html: true を使うと、htmlタグを取り除く(escape_html:true)が設定されていると、そちらが優先される。ｌ

```ruby
renderer = Redcarpet::Render::HTML.new(render_options = {escape_html: true, hard_wrap: true, with_toc_data: true, prettify: true})
@markdown = Redcarpet::Markdown.new(renderer, extensions = {autolink: true})
```

hard_wrap: true を使うと、markdown 無いの改行が、<br> タグに変換される。markdown 内の空行は、pタグによって分けられます。

fenced_code_blocks: true を使うと、```ruby で <pre><code> ブロックを生成したときに、<code class="ruby"> とすることができる。

with_toc_data: true　を使うと、見出しタグに id 属性が自動でつくようになる。id属性を使って、そのヘッダーにリンクすることができる。
でも、日本語でヘッダを書くと、何やらハッシュっぽい値がidとして設定される。使い勝手が悪いかもしれない。

おまけ、vscode の `Markdown all in one` を使って、TOC を生成ができる

| Column1 | Column2 | Column3 |
| :-----: | :-----: | :-----: |
| test    | Item1   | Item1   |

Markdown Snippets をインストールして、テーブルの snippets を使えるようにした
table と売って、ctrl + space で intellisence 使うと、テーブルの snippets が入力できる。

**太字** です
_下線_ です **_下線太字です_**
~~取り消し線です~~  ~~_**取り消し太字下線です**_~~

    `:disable_indented_code_blocks` で 行の先頭4文字にスペースを入れても、コードブロックとして解釈されない

==ハイライトです== ブートストラップのcssが聞いているので、いい感じにハイライトしてくれました。

This is a sentence[^1]
This is an another sentence[^2]


