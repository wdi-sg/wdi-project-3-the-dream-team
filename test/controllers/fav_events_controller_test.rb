require 'test_helper'

class FavEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fav_events_create_url
    assert_response :success
  end

end
