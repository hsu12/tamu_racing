require 'test_helper'

class GalleryControllerTest < ActionDispatch::IntegrationTest

  test "should get picture" do
    get "https://todohavefun-wpyy199544.c9users.io/picture"
    assert_response :success
  end

  test "should get video" do
    get "https://todohavefun-wpyy199544.c9users.io/video"
    assert_response :success
  end
end