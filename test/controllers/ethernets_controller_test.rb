require 'test_helper'

class EthernetsControllerTest < ActionController::TestCase
  setup do
    @ethernet = ethernets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ethernets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ethernet" do
    assert_difference('Ethernet.count') do
      post :create, ethernet: { distance: @ethernet.distance, name: @ethernet.name, speed: @ethernet.speed }
    end

    assert_redirected_to ethernet_path(assigns(:ethernet))
  end

  test "should show ethernet" do
    get :show, id: @ethernet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ethernet
    assert_response :success
  end

  test "should update ethernet" do
    patch :update, id: @ethernet, ethernet: { distance: @ethernet.distance, name: @ethernet.name, speed: @ethernet.speed }
    assert_redirected_to ethernet_path(assigns(:ethernet))
  end

  test "should destroy ethernet" do
    assert_difference('Ethernet.count', -1) do
      delete :destroy, id: @ethernet
    end

    assert_redirected_to ethernets_path
  end
end
