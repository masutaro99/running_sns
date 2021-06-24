require 'test_helper'

class PresignedurlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get presignedurl_index_url
    assert_response :success
  end

end
