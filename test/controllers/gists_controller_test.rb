require 'test_helper'

class GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gists_index_url
    assert_response :success
  end

  test "should get new" do
    get gists_new_url
    assert_response :success
  end

  test "should get show" do
    get gists_show_url
    assert_response :success
  end

  test "should get edit" do
    get gists_edit_url
    assert_response :success
  end

  test "should get delete" do
    get gists_delete_url
    assert_response :success
  end

end
