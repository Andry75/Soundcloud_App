require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get singin" do
    get pages_singin_url
    assert_response :success
  end

  test "should get sing" do
    get pages_sing_url
    assert_response :success
  end

  test "should get out" do
    get pages_out_url
    assert_response :success
  end

end
