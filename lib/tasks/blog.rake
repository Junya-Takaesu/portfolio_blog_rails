namespace :blog do
  desc "gitリポジトリと同期し、articles.json にエントリを追加し、対応する views/articles/_*.md.erb を作成する"
  task :new do
    begin
      puts "ブログのタイトルを入力してください"
      print "> "
      entry_title = gets.chomp

      system("git fetch --all")
      system("git checkout write-article")
      system("git rebase origin/main")

      articles_dir = "#{Rails.root.to_s}/app/views/articles/"
      json_path = "#{articles_dir}articles.json"
      json = File.read "#{articles_dir}articles.json"
      parsed_json = JSON.parse json

      new_id = parsed_json.length+1
      parsed_json[new_id.to_s] = {
        "id" => new_id,
        "title" => entry_title
      }

      File.write json_path, parsed_json.to_json

      system("cat #{articles_dir}articles.json | jq . > #{articles_dir}temp_articles.json")
      system("mv #{articles_dir}temp_articles.json #{articles_dir}articles.json")

      file_name = "#{articles_dir}_#{parsed_json[new_id.to_s]["id"]}.md.erb"
      File.write file_name, ""

      puts "[Success] 以下のブログを作成しました"
      puts "[File Name] #{file_name}"
      puts "[File Detail] #{parsed_json[new_id.to_s]}"

    rescue => e
      puts "[Failed] ブログの作成に失敗しました"
      puts "#{e.message}"
      system("cat #{articles_dir}articles.json | jq . > #{articles_dir}temp_articles.json")
      system("mv #{articles_dir}temp_articles.json #{articles_dir}articles.json")
    end
  end
end