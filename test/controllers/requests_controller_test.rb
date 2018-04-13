require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { active_dir: @request.active_dir, aplications: @request.aplications, bd: @request.bd, company_id: @request.company_id, description: @request.description, dhcp: @request.dhcp, dns: @request.dns, ftp: @request.ftp, logical_id: @request.logical_id, objective: @request.objective, observation: @request.observation, physical_id: @request.physical_id, proxy: @request.proxy, title: @request.title, video_conference: @request.video_conference, voip: @request.voip, web: @request.web }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    patch :update, id: @request, request: { active_dir: @request.active_dir, aplications: @request.aplications, bd: @request.bd, company_id: @request.company_id, description: @request.description, dhcp: @request.dhcp, dns: @request.dns, ftp: @request.ftp, logical_id: @request.logical_id, objective: @request.objective, observation: @request.observation, physical_id: @request.physical_id, proxy: @request.proxy, title: @request.title, video_conference: @request.video_conference, voip: @request.voip, web: @request.web }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
