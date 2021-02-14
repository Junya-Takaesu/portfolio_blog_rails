class Articles::List
  attr_reader :all

  def initialize
    @all = {
      1 => {id: 1, title: "21/1/30 初めての記事", article_path: "article1.md.erb"},
      2 => {id: 2, title: "21/1/31 Webpack と CDN の比較", article_path: "article2.md.erb"},
      3 => {id: 3, title: "21/2/1 Rails のレンダリングについて (View の表示)", article_path: "article3.md.erb"},
      4 => {id: 4, title: "21/2/2 コードスニペットをブログに取り入れる", article_path: "article4.md.erb"},
      5 => {id: 5, title: "21/2/3 画面の幅がブレイクポイントに達したら、レイアウトを変える", article_path: "article5.md.erb"},
      6 => {id: 6, title: "21/2/4 ruby で、postgresql のテーブルを検索するやり方", article_path: "article6.md.erb"},
      7 => {id: 7, title: "21/2/5 bootstrap 5 の justify-content utilities を使う", article_path: "article7.md.erb"},
      8 => {id: 8, title: "21/2/6 CSS練習(flex-box, 背景画像の設定, 疑似要素による明るさ設定)", article_path: "article8.md.erb"},
      9 => {id: 9, title: "21/2/7 markdown ブログを書き始める。", article_path: "article9.md.erb"},
      10 => {id: 10, title: "21/2/8 ダーツバーのウェブサイトを作成(練習)", article_path: "article10.md.erb"},
      11 => {id: 11, title: "21/2/9 配列と、ハッシュでは計算量に差が出る。", article_path: "article11.md.erb"},
      12 => {id: 12, title: "21/2/10 Sass変数が未定義になってしまう", article_path: "article12.md.erb"},
      13 => {id: 13, title: "21/2/10 sinatora で get と post 以外の http メソッドを扱う", article_path: "article13.md.erb"},
      14 => {id: 14, title: "21/2/10 コードハイライトを導入してみる", article_path: "article14.md.erb"},
      15 => {id: 15, title: "21/2/10 Turbolinks は 最初にサイトにアクセスしたときしか load イベントを発しない", article_path: "article15.md.erb"},
      16 => {id: 16, title: "21/2/12 css ファイルサイズを意識する", article_path: "article16.md.erb"},
      17 => {id: 17, title: "21/2/12 vscode 拡張機能 \"Live Sass Compiler\"", article_path: "article17.md.erb"},
    }
  end

  def get_by(id:)
    @all[id]
  end

  def reverse
    @all.sort_by {|k, v| -k}
  end
end