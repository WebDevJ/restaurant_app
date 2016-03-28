class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :menus, :parties do |t|
      t.index [:menu_id, :party_id]
      t.index [:party_id, :menu_id]
    end
  end
end
