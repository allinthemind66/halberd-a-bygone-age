require './input_choice.rb'
class Level1StartRoomChoices < InputChoice
  def first_choice(choice)
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
        puts choice
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
