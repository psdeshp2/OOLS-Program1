require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test "user name" do
   assert_equal(User.find_by_username("deep").crypted_password,"dee@gmail.com")
 end

  test "admin flag" do
    assert_equal(User.find_by_username("deep").admin_flag,0)
  end

  test "new user" do
   assert_not_nil( User.find_by_username("deep").crypted_password )
  end

  test "should not save user without username" do
  user= User.new
  assert !user.save
  end


 test "should not save user without crypted_password" do
   user= User.new
   assert !user.save
 end

end
