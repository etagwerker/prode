require 'test_helper'

class ForecastsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forecasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forecast" do
    assert_difference('Forecast.count') do
      post :create, :forecast => { }
    end

    assert_redirected_to forecast_path(assigns(:forecast))
  end

  test "should show forecast" do
    get :show, :id => forecasts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => forecasts(:one).to_param
    assert_response :success
  end

  test "should update forecast" do
    put :update, :id => forecasts(:one).to_param, :forecast => { }
    assert_redirected_to forecast_path(assigns(:forecast))
  end

  test "should destroy forecast" do
    assert_difference('Forecast.count', -1) do
      delete :destroy, :id => forecasts(:one).to_param
    end

    assert_redirected_to forecasts_path
  end
end
