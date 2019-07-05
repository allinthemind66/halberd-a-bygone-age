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

  def encumbered?(item_weight)
    total_weight = self.items.reduce(0) {|sum, item| sum + item.weight } + item_weight
    total_weight > self.encumberance ? true : false
  end

end
