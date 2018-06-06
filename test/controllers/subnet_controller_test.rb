require 'test_helper'

class SubnetControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
