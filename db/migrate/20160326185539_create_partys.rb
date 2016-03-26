class CreatePartys < ActiveRecord::Migration
  def change
    create_table :partys do |t|
      t.integer :table_num
      t.integer :guests
      t.boolean :payed
      t.references :user
    end
  end
end
