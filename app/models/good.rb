class Good < ActiveRecord::Base
 
  validates_uniqueness_of :name

  validates_presence_of :name, :price
  validates :price, :numericality => { only_integer: true, :greater_then => 0 }
  

 
end
