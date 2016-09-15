require 'test_helper'

class SoundcloudControllerTest < ActionDispatch::IntegrationTest
  test "should get connect" do
    get soundcloud_connect_url
    assert_response :success
  end

  test "should get connected" do
    get soundcloud_connected_url
    assert_response :success
  end

  test "should get destroy" do
    get soundcloud_destroy_url
    assert_response :success
  end

end
