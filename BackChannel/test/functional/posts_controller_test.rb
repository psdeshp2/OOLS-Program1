require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end
  test "should get index" do
    get :index
    assert_not_nil assigns(:posts)
  end
  test "should get new" do
    get :new
  end
  test "should create post" do
    assert_not_nil('Post.count') do
      post :create, post: { content: @post.content }
    end
  end
  test "should show post" do
    get :show, id: @post
  end
end
