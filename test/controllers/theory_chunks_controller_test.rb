require "test_helper"

class TheoryChunksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get theory_chunks_show_url
    assert_response :success
  end
end
