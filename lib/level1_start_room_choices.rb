require 'colorize'
require_relative './input_choice.rb'
require_relative './player.rb'


class Level1StartRoomChoices < InputChoice
  attr_reader :quit
  def initialize
    @quit = false
  end
  def first_choice
    @door_locked = true
    while true
      puts "What would you like to do now?"
      choice = gets.chomp.downcase
      case choice

      when 'forward', 'north', 'go north', 'go forward'
        scroll_text("You come upon a closed door.")
        new_line

      when 'west', 'left', 'go left', 'go west'
        if Player.all.first.inventory.include?("Torch")
          scroll_text ("You come upon an empty wall where a torch was.")
        else
          scroll_text("There is nothing but a wall with a torch.")
        end
        new_line

      when 'east', 'right', 'go east', 'go right'
        scroll_text("You look to your right and see a man shackled to the wall. Maybe you should go talk to him...")
        new_line

      when 'south', 'go south', 'back', 'go back'
        scroll_text("This part of the room has broken shackles on the wall... Best get moving.")
        new_line

      when 'help', 'commands'
        puts help

      when 'inventory'
        display_inventory

      when 'talk to man', 'talk', 'man', 'talk man'
        if @door_locked === true
        scroll_text("You walk over to the man and ask him his name. ")
        sleep(0.5)
        scroll_text(" He responds, hesitantly and with some surprise,\n")
        sleep(0.5)
        scroll_text(" What?!\n")
        sleep(0.2)
        scroll_text(" You do not recognize me?\n")
        sleep(0.8)
        scroll_text(" Its me, Ragnir! We've been shackled here for years!\n")
        sleep(0.3)
        scroll_text (" You've finally lost your mind, you poor wretch!\n")
        sleep(1)
        scroll_text(" Wait...")
        sleep(1.5)
        scroll_text(" How did you undo your shackles?!\n")
        sleep(0.5)
        scroll_text("At this moment you hear a loud boom and the door unhinges slightly.\n")
        puts "**BOOM**".red
        fork{exec "afplay", "./sounds/Explosion_2.wav"}
        @door_locked = false
        sleep(1)

        scroll_text("You hear a faint voice mumble '.....My liege...escape while theres still time...
        uurghhh...")
      else
        scroll_text ("Theres our chance for freedom! Go and get help!\n")
        scroll_text ("When you find a way to break my shackles... don't forget old Ragnir!")
      end
        new_line

      when  'Hello'
        scroll_text ('A voice somewhere responds "Hi there."')

      when "open door", "Open Door", "door", "Door", "open", "Open"
        if @door_locked === false
          scroll_text("You open the door")
          new_line
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          new_line
        end

      when 'leave room', 'leave'
        if @door_locked === false
          new_line
          fork{ exec  "killall", "afplay"}
          break
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          new_line
        end

      when  'torch'
        scroll_text ('The torch sits inside a sconce. It casts a pool of light around it.')
        new_line
        scroll_text ('Maybe it would be useful?')
        new_line

      when 'grab torch', 'take torch'
        if Player.all.first.inventory.include?("Torch")
          scroll_text ("You have already taken the torch")
        else
          scroll_text ("You take the torch from off the wall, it forms a pool of light around you.")
          new_line
          Player.all.first.add_item("Torch")
        end

      when 'drop item', 'drop'
        if Player.all.first.inventory.empty?
          scroll_text ("You have nothing to drop.")
          new_line
        else
          scroll_text ("What would you like to drop?")
          new_line
          item = gets.chomp.downcase
          Player.all.first.inventory.map! do |inventory_item|
            if item == inventory_item.downcase
              Player.all.first.inventory.delete(inventory_item)
              scroll_text ("You drop the #{inventory_item}")
              new_line
            else
              scroll_text ('hmmm... You do not have that item.')
              new_line
              break
            end
          end
        end

      when 'quit'
        puts "you are quiting. goodbye"
        @quit = true
        fork{ exec "killall", "afplay"}
        break
      else
        puts "Invalid choice, try again!"
      end
    end
    @quit
  end
end
