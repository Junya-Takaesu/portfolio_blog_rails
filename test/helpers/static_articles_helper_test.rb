class StaticArticlesHelperTest < ActionView::TestCase
  # 実行の仕方は？ -> rails test path/to/this/file
  # assert の種類は? -> https://guides.rubyonrails.org/testing.html#available-assertions

  test_articles = [
    {id: 1, title: "article1", hero_image: "1/hero-article1.jpg", article_path: "article1.md"},
    {id: 2, title: "article2", hero_image: "2/hero-article2.png", article_path: "article2.md"},
    {id: 3, title: "article3", hero_image: "3/hero-article3.jpg", article_path: "article3.md"},
    {id: 4, title: "article4", hero_image: "4/markus-spiske-cvBBO4PzWPg-unsplash.jpg", article_path: "article4.md"},
    {id: 5, title: "article5", hero_image: "5/ezgif-3-3463b321f157.gif", article_path: "article5.md"},
    {id: 6, title: "article6", hero_image: "6/luke-chesser-JKUTrJ4vK00-unsplash.jpg", article_path: "article6.md"},
    {id: 7, title: "article7", hero_image: "7/bootstrap.jpg", article_path: "article7.md"},
    {id: 8, title: "article8", hero_image: "8/flex-box-practice.jpg", article_path: "article8.md"},
    {id: 9, title: "article9", hero_image: "9/saba-sand.gif", article_path: "article9.md"},
  ]

  test_article_id = 2
  current_article = test_articles.select {|article| article[:id] == test_article_id}

  test "should return previous article link" do
    prev_article = test_articles.select {|article| article[:id] == test_article_id-1}

    expected = "<a class=\"btn btn-outline-warning col-12\" role=\"button\" href=\"#{prev_article[0][:id]}\">&lt;&lt;&lt; 前の記事: #{prev_article[0][:title]}</a>"
    result = generate_navigation_anchor(test_articles, current_article[0][:id], "prev")

    assert_equal expected, result
  end

  test "should return next article link" do
    next_article = test_articles.select {|article| article[:id] == test_article_id+1}

    expected = "<a class=\"btn btn-outline-warning col-12\" role=\"button\" href=\"#{next_article[0][:id]}\">#{next_article[0][:title]} :次の記事 &gt;&gt;&gt;</a>"
    result = generate_navigation_anchor(test_articles, current_article[0][:id], "next")

    assert_equal expected, result
  end

  test "should return disabled prev link" do
    expected = '<a class="btn btn-outline-secondary col-12 disabled" href="#">記事がありません</a>'
    result = generate_navigation_anchor(test_articles, test_articles[0][:id], "prev")

    assert_equal expected, result
  end

  test "should return disabled next link" do
    expected = '<a class="btn btn-outline-secondary col-12 disabled" href="#">記事がありません</a>'
    result = generate_navigation_anchor(test_articles, test_articles[test_articles.size-1][:id], "next")

    assert_equal expected, result
  end

end