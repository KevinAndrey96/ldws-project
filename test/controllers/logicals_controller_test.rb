require 'test_helper'

class LogicalsControllerTest < ActionController::TestCase
  setup do
    @logical = logicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logical" do
    assert_difference('Logical.count') do
      post :create, logical: { iptable: @logical.iptable, redundancy: @logical.redundancy, scalability: @logical.scalability, scripts: @logical.scripts, subnet_description: @logical.subnet_description, subnets: @logical.subnets }
    end

    assert_redirected_to logical_path(assigns(:logical))
  end

  test "should show logical" do
    get :show, id: @logical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logical
    assert_response :success
  end

  test "should update logical" do
    patch :update, id: @logical, logical: { iptable: @logical.iptable, redundancy: @logical.redundancy, scalability: @logical.scalability, scripts: @logical.scripts, subnet_description: @logical.subnet_description, subnets: @logical.subnets }
    assert_redirected_to logical_path(assigns(:logical))
  end

  test "should destroy logical" do
    assert_difference('Logical.count', -1) do
      delete :destroy, id: @logical
    end

    assert_redirected_to logicals_path
  end
end
