require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:michael)
  	# This code is not idiomatically correct.
  	@micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
  	assert @micropost.valid?
  end

  test "user id should be present" do
  	@micropost.user_id = nil
  	assert_not @micropost.valid?
  end

  test "content shoudl be present" do
  	@micropost.content = ""
  	assert_not @micropost.valid?
  end

  test "content should not be more than 140 characters" do
  	@micropost.content = "a" * 150
  	assert_not @micropost.valid?
  end

  test "order should be most recent first" do
  	assert_equal microposts(:most_recent), Micropost.first
  end

end
