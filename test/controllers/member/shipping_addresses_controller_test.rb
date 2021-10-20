require 'test_helper'

class Member::ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_shipping_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get member_shipping_addresses_edit_url
    assert_response :success
  end

end
