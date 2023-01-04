require "test_helper"

class Admin::SummariesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_summaries_show_url
    assert_response :success
  end
end
