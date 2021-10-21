class Member::OrdersController < ApplicationController
  def new
  end

  def confirm
    @cart_products = current_member.cart_products
        @order = Order.new(order_params)
        @order.postage = 800
        @order.payment_method = params[:order][:payment_method]

        #ラジオボタンで選択した時の取得する情報の条件分岐、enumではなくnew.html.erbで0,1,2を振り分けている
        if params[:order][:address_num] == "0"
            @order.postal_code = current_member.postal_code
            @order.address = current_member.address
            @order.name = current_member.last_name + current_member.first_name
        elsif params[:order][:address_num] == "1"
            #f.selectのaddress_boxの中の/:id の番号を取得する
            @shipping_address = ShippingAddress.find(params[:order][:address_box])
            @order.postal_code = @shipping_address.postal_code
            @order.address = @shipping_address.address
            @order.name = @shipping_address.name

        elsif params[:order][:address_num] == "2"
            @order.postal_code = params[:order][:postal_code]
            @order.address = params[:order][:address]
            @order.name = params[:order][:name]
        end

  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :name, :billing_amount, :postage, :status, :member_id)
    end
end
