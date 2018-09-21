require 'byebug'

class Player
  attr_reader :inventory
  @@count = 0
  @@instances = []

  def initialize
    @@count += 1
    @@instances << self
    @inventory = []
  end

  def self.all
    @@instances
  end

  def self.count
    @@count
  end

  def inventory
    @inventory
  end

  def add_item(item)
    @inventory << item
  end



end
