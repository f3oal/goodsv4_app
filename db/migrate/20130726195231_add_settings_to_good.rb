class AddSettingsToGood < ActiveRecord::Migration
  def change
    add_column :goods, :settings, :text
  end
end
