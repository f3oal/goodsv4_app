class Good < ActiveRecord::Base
 
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_then: 0 }  
  
end
