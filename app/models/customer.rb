class Customer < ApplicationRecord
  private
  EMAIL_VALIDATION_PATTERN_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  has_many :orders

  validates :email, presence: true,  uniqueness: true, format: {with:EMAIL_VALIDATION_PATTERN_REGEX}
  
end
