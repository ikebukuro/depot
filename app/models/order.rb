# encoding: utf-8
class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  PAYMENT_TYPES = [ ["現金",1], ["クレジットカート",2], ["注文書",3] ]
  
  validates :name, :address, :email, presence:true
  validates :pay_type, inclusion: PAYMENT_TYPES
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
