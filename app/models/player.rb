class Player < ActiveRecord::Base
  has_many :items

  def add_item(name, weight, price, weapon_strength)
    Item.create(name: name, player_id: self.id, weight: weight, price: price, weapon_strength: weapon_strength)
  end

  def has_item?(item_name)
    item = self.items.find_by(name: item_name)
    if item
      true
    else 
      false
    end
  end 

  def encumbered?
   #  This method will test if the player is too encumbered to pick up another item
   #  will return true or false
  end

end
