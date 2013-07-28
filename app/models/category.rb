class Category < ActiveRecord::Base
	has_many :goods
	validates :name, presence: true, uniqueness: true
end
