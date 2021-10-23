class Admin::SearchesController < ApplicationController
  def search
   @products = Product.search(params[:keyword])
   @keyword = params[:keyword]
  end
end
