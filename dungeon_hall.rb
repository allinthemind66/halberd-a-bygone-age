require 'byebug'

class DungeonHall
  def play_music
    fork{ exec "afplay", "./music/dungeon_hallway.mp3"}
  end
  def choices
    sleep(0.2)
    puts "\n"
    puts "You leave the room. You are in a dungeon hallway. It is dark"
    play_music
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
