require './input_choice.rb'
require "./player.rb"
class Level1StartRoomChoices < InputChoice

  def first_choice
    @door_locked = true
    while true
      # byebug
      puts "What would you like to do now?"
      choice = gets.chomp
      case choice
      when "forward", "north", "Forward", "North"
        scroll_text("You see a closed door.")
        puts "\n"
      when 'West', 'west', 'left', 'Left'
        if Player.all.first.inventory.include?("Torch")
          puts "You see an empty wall where a torch was."
        else
          scroll_text("There is nothing but a wall with a torch.")
          puts "\n"
        end
        puts "\n"
      when "East", 'east', 'Right', 'right'
        scroll_text("You look to your right and see a man shackled to the wall. Maybe you should go talk to him...")
        puts "\n"
      when "help", 'Help', 'HELP'
        puts '##############################################################'
        puts 'Directional commands: Up, down, left, right, forward, behind'
        puts '##############################################################'
        puts 'Other Commands: Talk, Open Door, open chest'
        puts '##############################################################'
        puts 'Game Commands: Map, Save, Quit Game'
      when 'talk to man', 'talk', 'Talk', 'man', 'Talk to Man', 'Talk to Man'
        @door_locked = false
        par =  "You walk over to the man and ask him his name. He responds, hesitantly and with some surprise,
        'What?! Its me Ragnir.'
        'You don't recognize me?' he says.
        At this moment you hear a loud boom, and the door unhinges slightly.
        You hear a faint voice mumble '.....My liege...escape while theres still time...
        ARRGHHHHHHHH!"
        scroll_text(par)
        puts "\n"
      when "hello", 'Hello'
        puts 'A voice somewhere responds "Hi there."'
      when "open door", "Open Door", "door", "Door", "open", "Open"
        if @door_locked === false
          scroll_text("You open the door")
          puts "\n"
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          puts "\n"
        end
      when "leave room", 'Leave Room', 'Leave room', 'leave', 'Leave'
        if @door_locked === false
          scroll_text("You walk outside into a dimly lit hallway.")
          puts "\n"
          fork{ exec "killall", "afplay"}
          break
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          puts "\n"
        end
      when 'Torch', 'torch'
        puts 'The torch sits inside a sconce. It casts a pool of light around it.'
        scroll_text ('Maybe it would be useful?')
        puts "\n"
      when "Take torch", 'Grab torch', 'grab torch', 'take torch'
        if Player.all.first.inventory.include?("Torch")
          puts "You have already taken the torch"
        else
          puts 'You take the torch from off the wall, it forms a pool of light around you'
          puts "\n"
          Player.all.first.add_item("Torch")
        end
      when 'quit'
        break
        puts "you are quiting. goodbye"
      else
        puts "Invalid choice, try again!"
      end
    end
    fork{ exec "killall", "afplay"}
  end
end
