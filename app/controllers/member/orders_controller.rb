class Member::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_member.address
    @shipping_address_new = ShippingAddress.new
    @shipping_addresses = current_member.shipping_addresses
  end

  def confirm
    @cart_products = current_member.cart_products
        @order = Order.new(order_params)
        @order.postage = 800
        #@order.payment_method = params[:order][:payment_method]

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
     #order_paramsで取得できる情報の保存
        order = Order.new(order_params)
        
        order.member_id = current_member.id
        # order.status = 0
        order.save

        #商品情報の保存
        cart_products = current_member.cart_products
        cart_products.each do |item|
            order_detail = OrderDetail.new
            order_detail.order_id = order.id
            order_detail.product_id = item.product.id
            order_detail.amount = item.amount
            order_detail.price = item.sub_price
            # order_details.status = 0
            order_detail.save
            end
            
            current_member.cart_products.destroy_all
        
        
        unless Member.where(id: order.member_id).where(postal_code: order.postal_code).where(address: order.address) || ShippingAddress.where(member_id: order.member_id).where(name: order.name).where(postal_code: order.postal_code).where(address: order.address).exits?                                       
            shipping_address = ShippingAddress.new
            shipping_address.member_id = order.member_id
            shipping_address.name = order.name
            shipping_address.postal_code = order.postal_code
            shipping_address.address = order.address
            shipping_address.save
        end
        redirect_to orders_complete_path
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
