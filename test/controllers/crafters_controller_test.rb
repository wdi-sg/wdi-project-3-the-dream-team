require 'test_helper'

class CraftersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crafters_index_url
    assert_response :success
  end

  test "should get new" do
    get crafters_new_url
    assert_response :success
  end

  test "should get create" do
    get crafters_create_url
    assert_response :success
  end

  test "should get edit" do
    get crafters_edit_url
    assert_response :success
  end

  test "should get update" do
    get crafters_update_url
    assert_response :success
  end

  test "should get destroy" do
    get crafters_destroy_url
    assert_response :success
  end

end
