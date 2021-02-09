class ArticlesHelperTest < ActionView::TestCase
  # 実行の仕方は？ -> rails test path/to/this/file
  # assert の種類は? -> https://guides.rubyonrails.org/testing.html#available-assertions

  test_articles = [
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