class Category < ActiveRecord::Base
	has_many :goods
	validates :name, presence: true, uniqueness: true

	before_destroy :destroy_goods 
	
	def destroy_goods
		unless goods.empty?
			return false
			errors.add(:base, "Category has some goods")	
		end
	end

end
