class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :strength
      t.integer :toughness
      t.integer :attacks
      t.integer :initiative
      t.integer :wounds
      t.string  :armour_save
      t.integer :leadership
      t.integer :encumberance
      t.integer :gold
    end
  end
end
