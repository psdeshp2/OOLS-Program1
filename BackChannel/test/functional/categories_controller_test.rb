require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index

    assert_nil assigns(:categories)
  end

  test "should get new" do
    get :new

  end

  test "should create category" do
    assert_not_nil('Category.count') do
      post :create, category: { name: @category.name }
    end
  end



  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end


  test "should destroy category" do
    assert_not_nil('Category.count', -1) do
      delete :destroy, id: @category
    end
  end



end
