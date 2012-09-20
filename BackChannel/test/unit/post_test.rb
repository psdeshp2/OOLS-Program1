require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post without user_id" do
    post = Post.new
    assert !post.save
  end

  test "should not save post without content" do
    post = Post.new
    assert !post.save
  end

end
