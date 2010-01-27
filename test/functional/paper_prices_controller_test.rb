require 'test_helper'

class PaperPricesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paper_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper_price" do
    assert_difference('PaperPrice.count') do
      post :create, :paper_price => { }
    end

    assert_redirected_to paper_price_path(assigns(:paper_price))
  end

  test "should show paper_price" do
    get :show, :id => paper_prices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => paper_prices(:one).to_param
    assert_response :success
  end

  test "should update paper_price" do
    put :update, :id => paper_prices(:one).to_param, :paper_price => { }
    assert_redirected_to paper_price_path(assigns(:paper_price))
  end

  test "should destroy paper_price" do
    assert_difference('PaperPrice.count', -1) do
      delete :destroy, :id => paper_prices(:one).to_param
    end

    assert_redirected_to paper_prices_path
  end
end
