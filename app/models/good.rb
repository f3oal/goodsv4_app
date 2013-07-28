class Good < ActiveRecord::Base
 
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }  


def category_name
	category ? category.name : 'No category'
end
  
end
