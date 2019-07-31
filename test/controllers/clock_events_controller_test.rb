require 'test_helper'

class ClockEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get checkin" do
    get clock_events_checkin_url
    assert_response :success
  end

  test "should get checkout" do
    get clock_events_checkout_url
    assert_response :success
  end

  test "should get edit" do
    get clock_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get clock_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get clock_events_destroy_url
    assert_response :success
  end

end
