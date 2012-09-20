require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get :index
 assert_nil assigns(:votes)
  end

  test "should get new" do
    get :new
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post :create, vote: {  }
    end
  end

  test "should show vote" do
    get :show, id: @vote
  end

  test "should get edit" do
    get :edit, id: @vote
  end

  test "should update vote" do
    put :update, id: @vote, vote: {  }
  end

  test "should destroy vote" do
    assert_not_nil('Vote.count', -1) do
      delete :destroy, id: @vote
    end
  end
end
