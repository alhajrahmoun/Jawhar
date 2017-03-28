require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get 400" do
    get pages_400_url
    assert_response :success
  end

  test "should get 404" do
    get pages_404_url
    assert_response :success
  end

  test "should get 500" do
    get pages_500_url
    assert_response :success
  end

end
