class Player
  attr_accessor :inventory
  byebug
  @inventory = []
  def inventory
    puts @inventory
  end

  def add_item(item)
    @inventory << item
  end

  

end
