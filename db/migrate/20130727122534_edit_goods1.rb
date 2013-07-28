class EditGoods1 < ActiveRecord::Migration
  def change
  end
  add_index :goods, [:category_id]
end
