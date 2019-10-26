require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(name:"Example",email:"example@email.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be invalid" do
    @user.name="   "
    assert_not @user.valid?
  end

  test "should not be valid" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "too long name" do
    @user.name = "a"*51
    assert_not @user.valid?
    @user.name = "a"*50
    assert @user.valid?
  end

  test "too long email" do
    @user.email = "a"*244+"@example.com"
    assert_not @user.valid?
    @user.email = "a"*243+"@example.com"
    assert @user.valid?
  end

  test "email validation invalid format" do
    invalid_addresses=%w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |in_add|
      @user.email=in_add
      assert_not @user.valid?,"#{in_add} should be invalid"
    end
  end

  test "email should be unique" do
    dup_user=@user.dup
    dup_user.email=dup_user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

end
