require 'byebug'
require_relative './input_choice.rb'

class DungeonHall < InputChoice
  def play_music
    fork{ exec "afplay", "./music/dungeon_hallway.mp3"}
  end
  def choices
    sleep(0.01)
    puts "\n"
    play_music
    scroll_text ("You leave the room. You are in a dungeon hallway.\n")
    scroll_text("On the floor lies the body of a masked man\n")
    scroll_text ("He is dead and has several large gashes throughout his body.\n")
    scroll_text ("It seems the door was blown open using some type of dark paste.\n")
    scroll_text ("Further down in the dungeon you can hear the sounds of fighting\n")
    while true
      puts "What would you like to do?"
      choice = gets.chomp
      case choice
      when "help", 'Help', 'HELP', 'commands', 'Commands'
        puts help
      when "look", "Look"
        scroll_text ("This hallway is partially lit along its way with torches.\n")
        scroll_text ("The floor is dirty and the walls are covered in soot\n")
        puts "\n"
      when "Look North", "look north", "look forward", "Look Forward"
        scroll_text ("Looking down the hall you can see shadows racing about and hear the sounds of fighting taking place.\n")
        scroll_text (" Maybe you should arm yourself...")
        puts "\n"
      when "Look Backwards", "look backwards", "look back", "Look Back", "Look South", "look south"
        scroll_text ("You look back and see the open door to the dungeon cell in which Ragnir is still shackled.")
        puts "\n"
      when "look right", "look left", "look west", "look east", "Look West", "Look East", "Look Left", "Look Right"
        scroll_text ("You see a dirty looking wall")
        puts "\n"
      when "quit"
        puts 'goodbye'
        fork{ exec "killall", "afplay"}
        break
      end
    end
  end
end
