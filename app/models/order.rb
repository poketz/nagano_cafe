class Order < ApplicationRecord
  belongs_to :customers
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { not_received: 0, confirming: 1, making: 2, preparing: 3, shipped: 4 } 
end
