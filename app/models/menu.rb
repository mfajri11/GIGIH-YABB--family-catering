class Menu < ApplicationRecord
  has_many :menu_orders
  has_many :orders, through: :menu_orders
  has_many :menu_categories
  has_many :categories, through: :menu_categories, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {only_float: true, greater_than_or_equal_to: 0.01}
  validates :description, length: {maximum: 150}

  scope :prices, ->{pluck(:price)}
  scope :names, ->{pluck(:name)}

  def join_all_categories
    categories.names.join(', ')
  end
end
