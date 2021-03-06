class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  
  has_many :cart_products, dependent: :destroy
  has_many :orders,through: :order_details,source: :order,dependent: :destroy
  attachment :image

  def add_tax_price
    (self.price * 1.10).round
  end

def self.search(keyword)
  where(["name like? OR name like?", "%#{keyword}%", "%#{keyword}%"])
end
end
