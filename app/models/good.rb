class Good < ActiveRecord::Base
 
<<<<<<< HEAD
  validates_uniqueness_of :name

  validates_presence_of :name, :price
  validates :price, :numericality => {  :greater_then => 0 }
=======
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }  
>>>>>>> 161fb2f2b27630d8ab2b543e1b660d3164d5f3dd
  
end
