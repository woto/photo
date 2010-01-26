require 'test_helper'

class PaperFormatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paper_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper_format" do
    assert_difference('PaperFormat.count') do
      post :create, :paper_format => { }
    end

    assert_redirected_to paper_format_path(assigns(:paper_format))
  end

  test "should show paper_format" do
    get :show, :id => paper_formats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => paper_formats(:one).to_param
    assert_response :success
  end

  test "should update paper_format" do
    put :update, :id => paper_formats(:one).to_param, :paper_format => { }
    assert_redirected_to paper_format_path(assigns(:paper_format))
  end

  test "should destroy paper_format" do
    assert_difference('PaperFormat.count', -1) do
      delete :destroy, :id => paper_formats(:one).to_param
    end

    assert_redirected_to paper_formats_path
  end
end
