require './input_choice.rb'
class Level1StartRoomChoices < InputChoice

  def first_choice
    @door_locked = true
    while true
      # byebug
      puts "What would you like to do now?"
      choice = gets.chomp
      case choice
      when "North"
        scroll_text("You see a closed door.")
        puts "\n"
      when "West"
        scroll_text("There is nothing but a wall with a torch.")
        puts "\n"
      when "East"
        scroll_text("You look to your right and see a man shackled to the wall. Maybe you should go talk to him...")
        puts "\n"
      when "help"
        puts '##############################################################'
        puts 'Directional commands: Up, down, left, right, forward, behind'
        puts '##############################################################'
        puts 'Other Commands: Talk, Open Door, open chest'
        puts '##############################################################'
        puts 'Game Commands: Map, Save, Quit Game'
      when 'talk to man'
        @door_locked = false
        par =  "You walk over to the man and ask him his name. He responds, hesitantly and with some surprise,
        'My name is Sir Goodboy.'
        'You don't recognize me?' he says.
        At this moment you hear a loud boom, and the door unhinges slightly"
        scroll_text(par)
        puts "\n"
      when "hello"
        puts 'A voice somewhere responds "Hi there."'
      when "open door"
        if @door_locked === false
          scroll_text("You open the door")
          puts "\n"
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          puts "\n"
        end
      when 'quit'
        break
      else
        puts "Invalid choice, try again!"
      end
    end
    fork{ exec "killall", "afplay"}
  end
end
