require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get make" do
    get comments_make_url
    assert_response :success
  end

end
