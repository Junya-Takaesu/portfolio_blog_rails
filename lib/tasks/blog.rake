require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir("#{Rails.root.to_s}/app/lib")
loader.setup

def ask_for_user_input(message, downcase=false)
  puts message
  print ">>> "
  input = gets.chomp.strip
  puts "\n"
  return input
end

def git_pull_latest
  puts "================================================================\n\n"
  system("git fetch origin")
  system("git checkout write-article")
  system("git rebase origin/main")
  puts "================================================================\n\n"
end

namespace :blog do
  desc "gitリポジトリと同期し、articles.json にエントリを追加し、対応する views/articles/_*.md.erb を作成する"
  task :new do
    entry_title = ask_for_user_input(message="ブログのタイトルを入力してください")
    entry_tags = ask_for_user_input(message="ブログのタグをカンマ区切りで入力してください", true)

    git_pull_latest

    new_id = Articles::List.new.all.length+1
    today = Date.today.iso8601
    
    article = Articles::Article.new(
      id: new_id, 
      title: "#{entry_title}", 
      created_at: today, 
      tags: entry_tags.split(","), 
      is_published: false
    )
    article.save

    puts "サイトマップを生成しますか？"
    print "(Y or n) > "
    confirm = gets.chomp.downcase.strip
    if confirm == "y"
      puts "サイトマップを生成します"
      Rake::Task["sitemap:refresh"].invoke
    else
      puts "サイトマップを生成しませんでした"
      puts "下記のコマンドでいつでもサイトマップの生成と、検索エンジンに PING することが出来ます"
      puts "rake sitemap:refresh"
    end
  end

  desc "git diff を表示し、問題なければ リモートリポジトリの write-article ブランチに push する"
  task :submit do
    system("git status")

    puts "submit しますか？"
    print "(Y or n) > "
    user_concent = gets.chomp.strip.gsub(/[[:space:]]/, '')
    cancels = ["n", "no"]
    if user_concent.nil? || cancels.include?(user_concent.downcase)
      puts "submit をキャンセルします"
      exit
    end
    puts "submit します"

    system("git add . && git commit -m \"Write article\" && git push origin write-article")
  end
end