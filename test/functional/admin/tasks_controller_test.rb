require 'test_helper'

class Admin::TasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Admin::Task.count') do
      post :create, :task => { }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, :id => admin_tasks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_tasks(:one).to_param
    assert_response :success
  end

  test "should update task" do
    put :update, :id => admin_tasks(:one).to_param, :task => { }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Admin::Task.count', -1) do
      delete :destroy, :id => admin_tasks(:one).to_param
    end

    assert_redirected_to admin_tasks_path
  end
end
