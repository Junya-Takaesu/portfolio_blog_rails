namespace :blog do
  desc "gitリポジトリと同期し、articles.json にエントリを追加し、対応する views/articles/_*.md.erb を作成する"
  task :new do
    begin
      puts "ブログのタイトルを入力してください"
      print "> "
      entry_title = gets.chomp

      puts "ブログのタグをカンマ区切りで入力してください"
      print "> "
      entry_tags = gets.chomp

      # Todo: ssh key をコンテナにコピーして、fetch もできるようにする
      # system("git fetch --all")
      system("git checkout write-article")
      # system("git rebase origin/main")

      articles_dir = "#{Rails.root.to_s}/app/views/articles/"
      json_path = "#{articles_dir}articles.json"
      json = File.read json_path
      parsed_json = JSON.parse json

      new_id = parsed_json.length+1
      today = Date.today
      parsed_json[new_id.to_s] = {
        "id" => new_id,
        "title" => "#{entry_title}",
        "created_at" => today.iso8601,
        "tags" => entry_tags.split(",")
      }

      File.write json_path, parsed_json.to_json

      system("cat #{json_path} | jq . > #{articles_dir}temp_articles.json")
      system("mv #{articles_dir}temp_articles.json #{json_path}")

      file_name = "#{articles_dir}_#{parsed_json[new_id.to_s]["id"]}.md.erb"
      File.write file_name, ""

      puts "[Success] 以下のブログを作成しました"
      puts "[File Name] #{file_name}"
      puts "[File Detail] #{parsed_json[new_id.to_s]}"

      system("code #{file_name}")

    rescue => e
      puts "[Failed] ブログの作成に失敗しました"
      puts "#{e.message}"
      system("cat #{json_path} | jq . > #{articles_dir}temp_articles.json")
      system("mv #{articles_dir}temp_articles.json #{json_path}")
    end
  end

  # Todo: ssh key をコンテナにコピーして、submit が実行できるようにする

  # desc "git diff を表示し、問題なければ リモートリポジトリの write-article ブランチに push する"
  # task :submit do
  #   system("git status")

  #   puts "submit しますか？"
  #   print "(Y or n) > "
  #   user_concent = gets.chomp.strip.gsub(/[[:space:]]/, '')
  #   cancels = ["n", "no"]
  #   if user_concent.nil? || cancels.include?(user_concent.downcase)
  #     puts "submit をキャンセルします"
  #     exit
  #   end
  #   puts "submit します"

  #   system("git add . && git commit -m \"Write article\" && git push origin write-article")
  # end
end