require_relative "../room"

class DungeonHallOne < Room
  attr_accessor :exit, :quit

  def entrance
    scroll_text "You leave the room. You are in a dungeon hallway.\n"
    scroll_text "On the floor lies the body of a masked man\n"
    scroll_text "He is dead and has several large gashes throughout his body.\n"
    scroll_text "It seems the door was blown open using some type of dark paste.\n"
    scroll_text "Further down in the dungeon you can hear the sounds of fighting\n"
  end

  def exit
    scroll_text "You begin to run down the hallway to face whatever is up in the room ahead!\n"
  end


  def choices(player)
    sleep(0.01)
    specific_spacer(2)

    while !@quit

      puts "What would you like to do?"
      choice = gets.chomp

      case choice
      when 'help', 'commands'
        clear
        puts help
        specific_spacer(2)

      when 'look'
        scroll_text "This hallway is partially lit along its way with torches.\n"
        scroll_text "The floor is dirty and the walls are covered in soot.\n"
        scroll_text "The body of the man lies in front of the door.\n"
        specific_spacer(2)

      when 'take items', 'take item'
        scroll_text ("Which item would you like to take?\n")
        specific_spacer(2)
        item_prompt = TTY::Prompt.new
        item_choice = item_prompt.select("Which item do you want to take?", marker: @sun_marker) do |menu|
          @items.each_with_index {|item, index| menu.choice "#{item}"}
        end
        if player.items.count == 2
          scroll_text "You can't pick up any more things!"
          specific_spacer(2)
        else
          # name, weight, price, weapon_strength
          player.add_item(item_choice, 10, 35, 3)
          @items.select {|item| item != item_choice}
          scroll_text "You pick up the #{item_choice}"
          specific_spacer(2)
        end

      when 'search', 'search man'
        scroll_text ("You search the dead mans body and find the following items: \n")
        @items.each_with_index{|item_name, index| scroll_text("#{index + 1}. #{item_name}\n")}
        specific_spacer(2)
      when 'look north', 'look forward'
        scroll_text ("Looking down the hall you can see shadows racing about and hear the sounds of fighting taking place.\n")
        scroll_text (" Maybe you should arm yourself...")
        specific_spacer(2)
      when 'look backwards', 'look back', 'look south'
        scroll_text ("You look back and see the open door to the dungeon cell in which Ragnir is still shackled.")
        specific_spacer(2)
      when 'look right', 'look left', 'look west', 'look east', 'look wall', 'wall'
        scroll_text ("You see a dirty looking wall")
        specific_spacer(2)
      when 'south', 'back', 'go back', 'go south'
        scroll_text ("You should probably try to find a way to get Ragnir out of his shackles before going back in...")
        specific_spacer(2)
      when 'left', 'right', 'east', 'west', 'go east', 'go west', 'go left', 'go right'
        scroll_text ("You see a dirty looking wall")
        specific_spacer(2)
      when 'north', 'forward', 'go north', 'go forward'
        specific_spacer(2)
        @quit = true
      when 'inventory'
        player.display_inventory
      when "quit"
        puts "you are quiting. goodbye"
        @quit = true
        good_bye
        break
      else
        puts "Invalid choice, try again!"
      end

    end
  end
end