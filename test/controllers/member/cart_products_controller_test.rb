require 'test_helper'

class Member::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_cart_products_index_url
    assert_response :success
  end

end
