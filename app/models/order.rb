class Order < ApplicationRecord
  belongs_to :customer
  has_many :menu_orders
  has_many :menus, through: :menu_orders
  # accepts_nested_attributes_for :menus, allow_destroy: true
  # accepts_nested_attributes_for :customer, update_only: true
  
  enum status: {
  NEW: 0,
  PAID: 1,
  CANCELLED: 2
}
  

  validates :total, numericality: {only_float:true}
  
  def calculate_total!
    write_attribute(:total, total_helper)
  end
  
  private
  def total_helper
    menus
    .prices
    .sum
  end
end
