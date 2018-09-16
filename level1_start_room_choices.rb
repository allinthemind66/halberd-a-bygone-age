require './input_choice.rb'
class Level1StartRoomChoices < InputChoice
  def first_choice
    while true
      # byebug
      puts "What would you like to do now?"
      choice = gets.chomp
      case choice
      when "North"
        puts choicegit
      when "West"
        puts choice
        # break
      when "East"
        puts "You look to your right and see a man shackled to the wall. Maybe you should go talk to him..."
      when "help"
        puts '##############################################################'
        puts 'Directional commands: Up, down, left, right, forward, behind'
        puts '##############################################################'
        puts 'Other Commands: Talk, Open Door, open chest'
        puts '##############################################################'
        puts 'Game Commands: Map, Save, Quit Game'
      when "hello"
        puts 'A voice somewhere responds "Hi there."'
      else
        puts "Invalid choice, try again!"
      end
    end
    fork{ exec "killall", "afplay"}
  end
end
