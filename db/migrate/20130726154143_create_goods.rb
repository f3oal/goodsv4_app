class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
