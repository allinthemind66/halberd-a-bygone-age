class DungeonHall
  def choices
    puts "You leave the room. You are in a dungeon hallway. It is dark"
    while true
      puts "What would you like to do?"
      choice = gets.chomp
      case choice
      when "look down hallway"
        puts "It is dark and mysterious"
      when "quit"
        puts 'goodbye'
        break
      end
    end
  end
end
