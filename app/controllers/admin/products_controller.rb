class Admin::ProductsController < ApplicationController
before_action :authenticate_admin!

 def index
  @products = Product.all
  @products = Product.page(params[:page]).per(10)
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

      redirect_to admin_product_path(@product.id)
  else
      render action: :new, danger: '登録に失敗しました'
  end
 end

 def destroy
 end

def search
  @products = Product.search(params[:keyword])
  @keyword = params[:keyword]
  render "search"
end


  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :is_active, :image, :price )
  end

end
