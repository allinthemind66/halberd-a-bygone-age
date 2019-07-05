class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
       t.integer :weapon_strength
       t.integer :weight
       t.integer :price
       t.integer :player_id
    end
  end
end