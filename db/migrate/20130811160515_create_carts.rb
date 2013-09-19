class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.timestamps
    end

    create_table :cart_items do |t|
      t.belongs_to :cart
      t.belongs_to :good
      t.integer :good_id
      t.integer :cart_id
      t.float :amount
      t.timestamps
    end
  end
end

