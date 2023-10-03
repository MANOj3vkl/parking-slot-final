require "test_helper"

class VehicleHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get vehicle_histories_search_url
    assert_response :success
  end
end
