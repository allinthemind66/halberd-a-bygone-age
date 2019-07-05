class Player < ActiveRecord::Base
  has_many :items

  def add_item(name, weight, price, weapon_strength)
    Item.create(name: name, player_id: self.id, weight: weight, price: price, weapon_strength: weapon_strength)
    self.reload
  end

  def has_item?(item_name)
    item = self.items.find_by(name: item_name)
    !!item
  end 

  def encumbered?(item_weight)
    total_weight = self.items.reduce(0) {|sum, item| sum + item.weight } + item_weight
    total_weight > self.encumberance ? true : false
  end

  def display_inventory
    if self.items.count == 0 
      scroll_text("Your inventory is empty")
    else 
      self.items.each_with_index do |item, index|
        scroll_text "#{index + 1}. #{item.name}"
      end
    end
  end

  def drop_item(item)
    item_to_drop = self.items.find_by(name: item)
    item_to_drop.destroy()
    self.reload
  end

end
