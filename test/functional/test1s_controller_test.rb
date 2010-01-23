require 'test_helper'

class Test1sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test1" do
    assert_difference('Test1.count') do
      post :create, :test1 => { }
    end

    assert_redirected_to test1_path(assigns(:test1))
  end

  test "should show test1" do
    get :show, :id => test1s(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test1s(:one).to_param
    assert_response :success
  end

  test "should update test1" do
    put :update, :id => test1s(:one).to_param, :test1 => { }
    assert_redirected_to test1_path(assigns(:test1))
  end

  test "should destroy test1" do
    assert_difference('Test1.count', -1) do
      delete :destroy, :id => test1s(:one).to_param
    end

    assert_redirected_to test1s_path
  end
end
