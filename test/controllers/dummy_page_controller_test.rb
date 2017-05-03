require 'test_helper'

class DummyPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dummy_page_index_url
    assert_response :success
  end

end
