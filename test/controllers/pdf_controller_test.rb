require 'test_helper'

class PdfControllerTest < ActionController::TestCase
  test "should get topologia" do
    get :topologia
    assert_response :success
  end

end
