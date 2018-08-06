require 'test_helper'

class TheSwitchesControllerTest < ActionController::TestCase
  setup do
    @the_switch = the_switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:the_switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create the_switch" do
    assert_difference('TheSwitch.count') do
      post :create, the_switch: { ports_id: @the_switch.ports_id, switches: @the_switch.switches }
    end

    assert_redirected_to the_switch_path(assigns(:the_switch))
  end

  test "should show the_switch" do
    get :show, id: @the_switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @the_switch
    assert_response :success
  end

  test "should update the_switch" do
    patch :update, id: @the_switch, the_switch: { ports_id: @the_switch.ports_id, switches: @the_switch.switches }
    assert_redirected_to the_switch_path(assigns(:the_switch))
  end

  test "should destroy the_switch" do
    assert_difference('TheSwitch.count', -1) do
      delete :destroy, id: @the_switch
    end

    assert_redirected_to the_switches_path
  end
end
