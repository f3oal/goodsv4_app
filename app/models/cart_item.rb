class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :good

  validates :good_id, uniqueness: true
end
