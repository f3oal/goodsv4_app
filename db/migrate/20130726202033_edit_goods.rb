class EditGoods < ActiveRecord::Migration
  def change
  	change_table :goods do |t|
  		t.belongs_to :category
  	end
  end
end
