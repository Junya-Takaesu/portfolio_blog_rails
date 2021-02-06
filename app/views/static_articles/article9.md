# <%= @article[:title] %>
## HTML より簡単に書けるので、Markdown が使いたい。
HTML でブログを書いていましたが、大変なので、`markdown` を使っていきたいと思います。
実際にこの文章も `markdown` で書いています。

`markdown` の記法については、下記の記事でおさらい
[Markdown記法一覧](https://qiita.com/oreo/items/82183bfbaac69971917f)


## ブログにどうやって Markdown を導入したか
`redcarpet` という gem を使って導入しました。
依存ライブラリを必要としないので、`gem install redcarpet` ですぐに使い始められました。

* https://github.com/vmg/redcarpet

## `redcarpet` を使う手順
    1. `Redcarpet::Render::HTML` インスタンスを作る
    2. `Redcarpet::Render::HTML` インスタンスと、拡張機能のオプションをまとめたハッシュを引数に `Redcarpet::Markdown` のインスタンスを作る
    3. `Redcarpet::Markdown` インスタンスのメソッド `render` を使って、markdown で書かれた文字列を html にレンダーする

### 1. `Redcarpet::Render::HTML` インスタンスを作る
```ruby
renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true)
```
* 引数なしでも、インスタンスが作れる
  * よく使いそうな引数：

        | 引数 | 意味 |
        | :------ | :------ |
        | escape_html   |  html タグをエスケープして、レンダーする  |
        | hard_wrap   |  文字列中の改行を <br> に変換する  |
        | with_toc_data   |  ヘッダー要素の id 属性に ヘッダーの文字列が設定される  |
        | link_attributes   |  aタグの属性をハッシュで指定する(例: {target: "_blank"})  |

* `width_toc_data` については、日本語の見出しのとき、ハッシュ値が id に設定される。英語の場合は、英語のスペースをハイフン区切りした、見出しが id に設定される。

    * `<h2 id="part-263d3c7416ea4e01">これは日本語のヘッダー</h2>`
    * `<h2 id="this-is-an-english-header">this is an english header</h2>`

### 2. `Redcarpet::Render::HTML` インスタンスと、拡張機能のオプションをまとめたハッシュを引数に `Redcarpet::Markdown` のインスタンスを作る
```ruby
markdown = Redcarpet::Markdown.new(renderer, extensions = {})
```
* `renderer` は 1 の手順で生成したインスタンス
* `extensions` に色々拡張機能を指定できる（というか指定しないと、機能がほとんどなくて意味がない。)
  * 使いたい拡張機能

    | extensions | 内容 |
    | :------ | :------- |
    | autolink   | http や https で始まる文字列が自動的にaタグに変換される   |
    | fenced_code_blocks   | バッククオートx3 でコードブロックが書ける  |
    | tables   | テーブル記法が有効になる |
    | underline   |  下線の記法が有効になる  |
    | strikethrough   |  取り消し線の記法が有効になる  |
    | disable_indented_code_blocks   |  インデントによるコードブロック記法を無効にする(バッククオートを使いたいので)  |
    | highlight   |  ハイライト記法が有効になる  |
    | footnotes   |  脚注が有効になる  |


### 3. `Redcarpet::Markdown` インスタンスのメソッド `render` を使って、markdown で書かれた文字列を html にレンダーする
```ruby
markdown.render("# markdown のフォーマットで書かれた文字列")
```

## ブログへの実装
* 記事本文を md ファイルで作成
* コントローラで、md ファイルを読み込み、パースして HTML に変換
* コントローラから、ビューに 変換された 本文の HTML を渡して、パーシャル風にビューに取り込む

以下のような parse メソッドを ApplicationController に作って、記事を扱う StaticArticlesController で、このメソッドを使ってHTMLに変換します。

```ruby
  def parse(
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
```

この関数を Application コントローラに書くという判断が正しかったか、自信が無いです。view で使えるように、ヘルパー関数として定義するか、lib ディレクトリにモジュールとして作成するという判断もあったかと思うので・・・。

Rails の理解が浅くて、結構適当になってしまいましたが、なんとかブログの Markdown 化ができました。

次は、コードをきれいに表示できるように、コードハイライトのライブラリを導入したい。
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FJunya-Takaesu%2Fsaba-sand&count_bg=%2386927C&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)