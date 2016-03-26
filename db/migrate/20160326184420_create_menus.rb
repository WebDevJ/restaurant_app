class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :cuisine
      t.integer :price
      t.boolean :peanuts
      t.boolean :gluten
      t.boolean :dairy
    end
  end
end
