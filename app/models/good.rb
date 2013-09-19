class Good < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_line_item

	has_many :cart_items
  has_many :carts, :through => :cart_items
  belongs_to :category
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def ensure_not_referenced_by_any_line_item
  	if line_items.count.zero?
  		return true
  	else
  		errors[:base] << "Line Items present"
  		return false
  	end
  end

  def category_name
    category ? category.name : 'No category'
  end

end
