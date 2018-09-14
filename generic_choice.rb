require './input_choice.rb'
class GenericChoice < InputChoice
  def first_choice(choice)
    while true
      # byebug
      puts "What would you like to do now?"
      choice = gets.chomp
      if choice === "North"
        puts choice
        break
      elsif choice === "West"
        puts choice
        break
      elsif choice === "East"
        puts choice
      else
        puts "Invalid choice, try again!"
      end
    end
    fork{ exec "killall", "afplay"}
  end
end
