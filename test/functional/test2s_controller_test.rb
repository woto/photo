require 'test_helper'

class Test2sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test2" do
    assert_difference('Test2.count') do
      post :create, :test2 => { }
    end

    assert_redirected_to test2_path(assigns(:test2))
  end

  test "should show test2" do
    get :show, :id => test2s(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test2s(:one).to_param
    assert_response :success
  end

  test "should update test2" do
    put :update, :id => test2s(:one).to_param, :test2 => { }
    assert_redirected_to test2_path(assigns(:test2))
  end

  test "should destroy test2" do
    assert_difference('Test2.count', -1) do
      delete :destroy, :id => test2s(:one).to_param
    end

    assert_redirected_to test2s_path
  end
end
