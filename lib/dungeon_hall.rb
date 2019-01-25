require 'byebug'
require_relative './input_choice.rb'

class DungeonHall < InputChoice
  def play_music
    fork{ exec "afplay", "./music/dungeon_hallway.mp3"}
  end
  def choices
    sleep(0.01)
    new_line
    play_music
    scroll_text ("You leave the room. You are in a dungeon hallway.\n")
    scroll_text("On the floor lies the body of a masked man\n")
    scroll_text ("He is dead and has several large gashes throughout his body.\n")
    scroll_text ("It seems the door was blown open using some type of dark paste.\n")
    scroll_text ("Further down in the dungeon you can hear the sounds of fighting\n")
    while true
      puts "What would you like to do?"
      choice = gets.chomp
      dead_man_items = ["Short Sword", "12 Gold Coins", "Coil of Rope"]
      case choice
      when 'help', 'commands'
        puts help
        new_line

      when 'look'
        scroll_text ("This hallway is partially lit along its way with torches.\n")
        scroll_text ("The floor is dirty and the walls are covered in soot.\n")
        scroll_text ("The body of the man lies in front of the door.\n")
        new_line

      when 'take items', 'take item'
        scroll_text ("Which item would you like to take?\n")
        item = gets.chomp.downcase
        new_line
        dead_man_items.each do |x|
          if item == x.downcase && Player.all.first.inventory.size < 2
            Player.all.first.inventory << x
            scroll_text ("You pick up the #{x}")
            dead_man_items.delete(x)
            # byebug
            break
          elsif item != x.downcase
            scroll_text ("That item is not there.")
            break
          else
            scroll_text ("You can only hold two items at a time!")
            break
          end
        end
        new_line

      when 'search', 'search man'
        scroll_text ("You search the dead mans body and find the following items: \n")
        # byebug
        dead_man_items.compact!
        dead_man_items.each_with_index{|item_name, index| scroll_text("#{index + 1}. #{item_name}\n")}
        new_line

      when 'look north', 'look forward'
        scroll_text ("Looking down the hall you can see shadows racing about and hear the sounds of fighting taking place.\n")
        scroll_text (" Maybe you should arm yourself...")
        new_line

      when 'look backwards', 'look back', 'look south'
        scroll_text ("You look back and see the open door to the dungeon cell in which Ragnir is still shackled.")
        new_line

      when 'look right', 'look left', 'look west', 'look east', 'look wall', 'wall'
        scroll_text ("You see a dirty looking wall")
        new_line

      when 'south', 'back', 'go back', 'go south'
        scroll_text ("You should probably try to find a way to get Ragnir out of his shackles before going back in...")
        new_line

      when 'left', 'right', 'east', 'west', 'go east', 'go west', 'go left', 'go right'
        scroll_text ("You see a dirty looking wall")
        new_line

      when 'north', 'forward', 'go north', 'go forward'
        new_line
        puts 'you head to the next room...To be Continued!!!'
        fork{ exec "killall", "afplay"}
        break
        
      when 'inventory'
        display_inventory

      when "quit"
        puts 'goodbye'
        fork{ exec "killall", "afplay"}
        break
      end

    end
  end
end
