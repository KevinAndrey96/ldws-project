require 'test_helper'

class PhysicalsControllerTest < ActionController::TestCase
  setup do
    @physical = physicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical" do
    assert_difference('Physical.count') do
      post :create, physical: { company_id: @physical.company_id, computers: @physical.computers, conference_hall: @physical.conference_hall, height: @physical.height, large: @physical.large, width: @physical.width }
    end

    assert_redirected_to physical_path(assigns(:physical))
  end

  test "should show physical" do
    get :show, id: @physical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical
    assert_response :success
  end

  test "should update physical" do
    patch :update, id: @physical, physical: { company_id: @physical.company_id, computers: @physical.computers, conference_hall: @physical.conference_hall, height: @physical.height, large: @physical.large, width: @physical.width }
    assert_redirected_to physical_path(assigns(:physical))
  end

  test "should destroy physical" do
    assert_difference('Physical.count', -1) do
      delete :destroy, id: @physical
    end

    assert_redirected_to physicals_path
  end
end
