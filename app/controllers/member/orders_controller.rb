class Member::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_member.address
    @shipping_address_new = ShippingAddress.new
    @shipping_addresses = current_member.shipping_addresses
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end
  
end
