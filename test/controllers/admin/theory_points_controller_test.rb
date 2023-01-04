require "test_helper"

class Admin::TheoryPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_theory_points_new_url
    assert_response :success
  end
end
