class Admin::OrderDetailsController < ApplicationController
 def update
    @order_product = OrderDetail.find(params[:id])
    @order_product.update(order_product_params)
    order = @order_product.order
    @order_products = order.order_products
    order_products_completed = @order_products.where(status: "production_complete")
    if @order_product.status == "in_production"
      @order_product.order.status = "in_production"
      @order_product.order.save
    elsif @order_products.count == order_products_completed.count
      @order_product.order.status = "preparing_delivery"
      @order_product.order.save
    end
    redirect_to admins_order_path(params[:order_id])
  end

  private

  def order_product_params
    params..permit(:maiking_status)
  end
end