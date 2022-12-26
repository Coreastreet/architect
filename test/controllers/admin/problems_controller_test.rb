require "test_helper"

class Admin::ProblemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_problems_show_url
    assert_response :success
  end
end
