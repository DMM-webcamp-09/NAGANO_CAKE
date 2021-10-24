class Member::OrdersController < ApplicationController
  def new
    @order = Order.new
    @member = current_member
    @addresses = @member.shipping_addresses
  end

  def confirm
    @cart_products = current_member.cart_products.page(params[:page]).per(4)

    # createから持ってきた
    member = current_member

  	# sessionを使ってデータを一時保存
  	session[:order] = Order.new
  	cart_products = current_member.cart_products

  	# total_paymentのための計算
  	sum = 0
  	cart_products.each do |cart_product|
  		sum += (cart_product.product.add_tax_price).floor * cart_product.amount
  	end

  	session[:order][:postage] = 800
  	#送料込みの合計金額
  	session[:order][:billing_amount] = sum + session[:order][:postage]
  	#注文ステータス
  	session[:order][:status] = 0
  	session[:order][:member_id] = current_member.id
  	# ラジオボタンで選択された支払方法のenum番号を渡している
  	session[:order][:payment_method] = params[:payment_method].to_i

  	# ラジオボタンで選択されたお届け先によって条件分岐
  	destination = params[:a_method].to_i
  	# ご自身の住所が選択された時
  	if destination == 0
  		session[:order][:postal_code] = member.postal_code
  		session[:order][:address] = member.address
  		session[:order][:name] = member.last_name + member.first_name
  		# 登録済住所が選択された時
  	elsif destination == 1
  		address = ShippingAddress.find(params[:address_for_order])
  		session[:order][:postal_code] = address.postal_code.to_i
  		session[:order][:address] = address.address
  		session[:order][:name] = address.name
  	# 新しいお届け先が選択された時
  	elsif destination == 2
  		session[:new_address] = 2
  		session[:order][:postal_code] = params[:postal_code].to_i
  		session[:order][:address] = params[:address]
  		session[:order][:name] = params[:name]
  	end
  	# お届け先情報に漏れがあればリダイレクト
  	if session[:order][:postal_code].presence && session[:order][:address].presence && session[:order][:name].presence
     #redirect_to
  	else
  		flash[:alert] = 'お届け先情報を入力してください'
  		redirect_to orders_new_path
  	end

  end

  def create
  	order = Order.new(session[:order])
	  order.save

		# 新しいお届け先を自動で保存
		if session[:new_address]
			address = current_member.shipping_addresses.new
			address.postal_code = order.postal_code
			address.address = order.address
			address.name = order.name
			address.save
			session[:new_address] = nil
		end
		# 以下、order_detail(中間テーブル)作成
		cart_products = current_member.cart_products
		cart_products.each do |cart_product|
		order_detail = OrderDetail.new
		order_detail.order_id = order.id
		order_detail.product_id = cart_product.product.id
		order_detail.amount = cart_product.amount
		order_detail.maiking_status = 0
		order_detail.price = (cart_product.product.add_tax_price).floor
		order_detail.save
		end
		session.delete(:order)
		session[:order] = nil
		# 購入後はカート内商品削除
		cart_products.destroy_all
		redirect_to orders_complete_path
  end


  def complete
  end

  def index
  	@orders = current_member.orders.page(params[:page]).per(6)
  end

  def show
  	@order = Order.find(params[:id])
  	@order_details = @order.order_details
  end

end
