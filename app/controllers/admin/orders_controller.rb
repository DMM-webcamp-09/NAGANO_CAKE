class Admin::OrdersController < ApplicationController

 def index
   @orders = Order.page(params[:page]).per(10).reverse_order
 end

 def show
   @order = Order.find(params[:id])
   @order_products = @order.order_details
 end

 def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   @order_products = @order.order_details
   puts "============="
p @order.status
puts "============="
   if @order.status == "payment_confirmation"
      @order_products.each do |order_product|
        order_product.maiking_status = "production_pending"
        order_product.save
     end
   end
    redirect_to admin_order_path(@order.id)
 end

  private

  def order_params
    params.require(:order).permit(:status)

  end 

  end



 def order_details_params
    params.require(:order_details).permit(:maiking_status)
 end 


end
