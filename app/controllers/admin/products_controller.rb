class Admin::ProductsController < ApplicationController


 def index
  @products = Product.all
 end

 def show
  @product = Product.find(params[:id])
 end

 def edit
  @product = Product.find(params[:id])
 end

 def update
  @product = Product.find(params[:id])
  if @product.update(product_params)
     redirect_to admin_product_path
  else
   flash[:error] = "入力してください"
      redirect_to 'edit'
  end
 end

 def new
  @product = Product.new
 end

 def create
  @product = Product.new(product_params)
  if @product.save
      redirect_to admin_product_path(@product)
  else
      flash[:error] = "入力してください"
      redirect_to new_admin_product_path
  end
 end

 def destroy
 end
  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :descript, :is_active, :product_image, :product_price, :created_at, :updated_at)
  end

end
