require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get idex" do
    get :idex
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
