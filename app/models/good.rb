class Good < ActiveRecord::Base
 
  validates_uniqueness_of :name

  validates_presence_of :name, :price
  validates :price, :numericality => {  :greater_then => 0 }
  

 
end
