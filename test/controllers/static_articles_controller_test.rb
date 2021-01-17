require "test_helper"

class StaticArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get static_articles_show_url
    assert_response :success
  end
end
