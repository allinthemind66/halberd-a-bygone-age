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
      # byebug
      puts "What would you like to do now?"
      choice = gets.chomp
      case choice
      when "forward", "north", "Forward", "North"
        scroll_text("You come upon a closed door.")
        puts "\n"
      when 'West', 'west', 'left', 'Left'
        if Player.all.first.inventory.include?("Torch")
          puts "You come upon an empty wall where a torch was."
        else
          scroll_text("There is nothing but a wall with a torch.")
          puts "\n"
        end
        puts "\n"
      when "East", 'east', 'Right', 'right'
        scroll_text("You look to your right and see a man shackled to the wall. Maybe you should go talk to him...")
        puts "\n"
      when "Back", "back", "south", "South"
        scroll_text("This part of the room has broken shackles on the wall... Best get moving.")
      when "help", 'Help', 'HELP', 'commands', 'Commands'
        puts help
      when "inventory"
          puts "You currently have: "
          Player.all.first.inventory.each{|item| puts item }
      when 'talk to man', 'talk', 'Talk', 'man', 'Talk to Man', 'Talk to Man', 'talk man', 'Talk Man'
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
        ARRGHHHHHHHH!")
      else
        scroll_text ("Theres our chance for freedom! Go and get help!\n")
        scroll_text ("When you find a way to break my shackles... don't forget old Ragnir!")
      end
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
