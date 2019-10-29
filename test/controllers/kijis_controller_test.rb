require 'test_helper'

class KijisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kiji = kijis(:one)
  end

  test "should get index" do
    get kijis_url
    assert_response :success
  end

  test "should get new" do
    get new_kiji_url
    assert_response :success
  end

  test "should create kiji" do
    assert_difference('Kiji.count') do
      post kijis_url, params: { kiji: { content: @kiji.content, title: @kiji.title, user_id: @kiji.user_id } }
    end

    assert_redirected_to kiji_url(Kiji.last)
  end

  test "should show kiji" do
    get kiji_url(@kiji)
    assert_response :success
  end

  test "should get edit" do
    get edit_kiji_url(@kiji)
    assert_response :success
  end

  test "should update kiji" do
    patch kiji_url(@kiji), params: { kiji: { content: @kiji.content, title: @kiji.title, user_id: @kiji.user_id } }
    assert_redirected_to kiji_url(@kiji)
  end

  test "should destroy kiji" do
    assert_difference('Kiji.count', -1) do
      delete kiji_url(@kiji)
    end

    assert_redirected_to kijis_url
  end
end
