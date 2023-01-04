require "test_helper"

class Admin::LessonPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_lesson_pages_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_lesson_pages_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_lesson_pages_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_lesson_pages_destroy_url
    assert_response :success
  end

  test "should get update" do
    get admin_lesson_pages_update_url
    assert_response :success
  end
end
