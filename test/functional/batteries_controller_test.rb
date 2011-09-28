require 'test_helper'

class BatteriesControllerTest < ActionController::TestCase
  setup do
    @battery = batteries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batteries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battery" do
    assert_difference('Battery.count') do
      post :create, :battery => @battery.attributes
    end

    assert_redirected_to battery_path(assigns(:battery))
  end

  test "should show battery" do
    get :show, :id => @battery.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @battery.to_param
    assert_response :success
  end

  test "should update battery" do
    put :update, :id => @battery.to_param, :battery => @battery.attributes
    assert_redirected_to battery_path(assigns(:battery))
  end

  test "should destroy battery" do
    assert_difference('Battery.count', -1) do
      delete :destroy, :id => @battery.to_param
    end

    assert_redirected_to batteries_path
  end
end
