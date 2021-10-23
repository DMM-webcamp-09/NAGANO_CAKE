class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders,through: :order_details,source: :order
  attachment :image

  def add_tax_price
    (self.price * 1.10).round
  end


end
