# junyablog の README.md

## ブログの URL

http://junya-takaesu.site/

## rails コマンド(rake コマンド)

### 新しいブログのエントリーを追加する

```
rails blog:new
```

* このコマンドにより `lib/tasks/blog.rake` の `task :new`　が実行される
* `app/views/articles` ディレクトリに、空の Markdown ファイルが作成され、ブログを書き始められる。
* `app/views/articles/articles.json` に、ブログ記事のメタ情報が記録される（作成日など）

### 作成したブログをコミットする

```
rails blog:submit
```

* このコマンドにより `lib/tasks/blog.rake` の `task :submit`　が実行される
* git にコミットするかどうかプロンプトされる
* コミットを承諾すると、git にコミットされ、github リポジトリの所定のブランチに push される
* github 上で、所定のブランチに push されたコミットを main ブランチにマージすると、連動して heroku にデプロイされる。（記事が一般に公開される）