require 'test_helper'

class Admin::PrinterTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_printer_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create printer_type" do
    assert_difference('Admin::PrinterType.count') do
      post :create, :printer_type => { }
    end

    assert_redirected_to printer_type_path(assigns(:printer_type))
  end

  test "should show printer_type" do
    get :show, :id => admin_printer_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_printer_types(:one).to_param
    assert_response :success
  end

  test "should update printer_type" do
    put :update, :id => admin_printer_types(:one).to_param, :printer_type => { }
    assert_redirected_to printer_type_path(assigns(:printer_type))
  end

  test "should destroy printer_type" do
    assert_difference('Admin::PrinterType.count', -1) do
      delete :destroy, :id => admin_printer_types(:one).to_param
    end

    assert_redirected_to admin_printer_types_path
  end
end
