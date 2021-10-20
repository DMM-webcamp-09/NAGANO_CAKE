class Member::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_member.shipping_addresses
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_params)
    @shipping_address.member_id = current_member.id
    # バリデーションつけたらif文を書く
    @shipping_address.save
    redirect_to shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_params)
    redirect_to shipping_addresses_path
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path
  end

  private
  def shipping_params
    params.require(:shipping_address).permit(:name, :postal_code, :address)
  end

end
