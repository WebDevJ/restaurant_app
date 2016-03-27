class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :table_num
     t.integer :guests
    end
  end
end
