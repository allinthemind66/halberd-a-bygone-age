require './input_choice.rb'
class Level1StartRoomChoices < InputChoice
  def first_choice
    while true
      # byebug
      puts "What would you like to do now?"
      choice = gets.chomp
      if choice === "North"
        puts choice
      elsif choice === "West"
        puts choice
        break
      elsif choice === "East"
        puts "You look to your right and see a man shackled to the wall. Maybe you should go talk to him..."
      elsif choice === "help"
        Level1StartRoomChoices.new.help
      elsif choice === "hello"
        puts 'A voice somewhere responds "Hi there."'
      else
        puts "Invalid choice, try again!"
      end
    end
    fork{ exec "killall", "afplay"}
  end
end
