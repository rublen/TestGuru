require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get badges_new_url
    assert_response :success
  end

  test "should get create" do
    get badges_create_url
    assert_response :success
  end

  test "should get show" do
    get badges_show_url
    assert_response :success
  end

  test "should get update" do
    get badges_update_url
    assert_response :success
  end

  test "should get delete" do
    get badges_delete_url
    assert_response :success
  end

end
