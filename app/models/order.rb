class Order < ApplicationRecord
    has_many :order_details,dependent: :destroy

    belongs_to :member

    has_many :products,through: :order_details,source: :product

    enum payment_method: { credit_card:0, transfer:1 }

    enum status: {
        payment_waiting:0,#入金待ち
        payment_confirmation:1,#入金確認
        in_production:2,#製作中
        preparing_delivery:3,#発送準備中
        delivered:4 #発送済み
    }
end
