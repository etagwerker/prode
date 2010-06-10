require 'test_helper'

class TopFoursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_fours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_four" do
    assert_difference('TopFour.count') do
      post :create, :top_four => { }
    end

    assert_redirected_to top_four_path(assigns(:top_four))
  end

  test "should show top_four" do
    get :show, :id => top_fours(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => top_fours(:one).to_param
    assert_response :success
  end

  test "should update top_four" do
    put :update, :id => top_fours(:one).to_param, :top_four => { }
    assert_redirected_to top_four_path(assigns(:top_four))
  end

  test "should destroy top_four" do
    assert_difference('TopFour.count', -1) do
      delete :destroy, :id => top_fours(:one).to_param
    end

    assert_redirected_to top_fours_path
  end
end
