require "test_helper"

class SourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sources_show_url
    assert_response :success
  end
end
