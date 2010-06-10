require 'test_helper'

class SystemOptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_option" do
    assert_difference('SystemOption.count') do
      post :create, :system_option => { }
    end

    assert_redirected_to system_option_path(assigns(:system_option))
  end

  test "should show system_option" do
    get :show, :id => system_options(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => system_options(:one).to_param
    assert_response :success
  end

  test "should update system_option" do
    put :update, :id => system_options(:one).to_param, :system_option => { }
    assert_redirected_to system_option_path(assigns(:system_option))
  end

  test "should destroy system_option" do
    assert_difference('SystemOption.count', -1) do
      delete :destroy, :id => system_options(:one).to_param
    end

    assert_redirected_to system_options_path
  end
end
