class ArticlesListTest < ActionView::TestCase

  ARTICLES_LIST = Articles::List::ARTICLES_BY_ID

  test "Should return hash" do
    assert_instance_of Hash, ARTICLES_LIST
  end
  test "Should return Article instance" do
    assert_instance_of Articles::Article, ARTICLES_LIST[ARTICLES_LIST.keys.first]
  end
  test "Should return Articles in descending order" do
    current_key = 0
    Articles::List.reverse.each do |key, article|
      if current_key == 0
        current_key = key
      else
        previouse_key = current_key
        current_key = key
        if previouse_key < current_key
          assert false
        end
      end
    end
    assert true
  end
end