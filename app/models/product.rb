class Product < ApplicationRecord
  belongs_to :genre
  has_many :orders, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  attachment :product_image

  validates :name, {presence: true}
  validates :descript, {presence: true}
  validates :product_price, {presence: true}



end
