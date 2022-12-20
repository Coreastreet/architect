require "test_helper"

class DeviceUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get send_message" do
    get device_users_send_message_url
    assert_response :success
  end
end
