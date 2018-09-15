require 'artii'
require './level1_start_room_choices.rb'
require './input_choice.rb'
require 'byebug'

def play_music
    pid = fork{exec "afplay", "./music/Halberd_theme.m4a"}
end


def title
    puts ('  ___ ___        .__ ___.                    .___')
    puts (' /   |   \_____  |  |\_ |__   ___________  __| _/')
    puts ('/    ~    \__  \ |  | | __ \_/ __ \_  __ \/ __ | ')
    puts ('\    Y    // __ \|  |_| \_\ \  ___/|  | \/ /_/ | ')
    puts (' \___|_  /(____  /____/___  /\___  >__|  \____ | ')
    puts ('      \/      \/         \/     \/           \/  ')
    puts ('###########################################################################################')
    puts ('###########################################################################################')
    puts ('###########################################################################################')
    a = Artii::Base.new :font => 'slant'
    puts (a.asciify('Journey Through The Darkness'))
    puts ('###########################################################################################')
    puts ('###########################################################################################')
    puts ('###########################################################################################')
  end

# This is the explanation of the game. Mood setting tag that
# will be before every game set in the halberd universe
def world_tag
  puts "                                                                        "
  puts "                                                                        "
  puts "In a grim and perlious world the darkness consumes all. Brave adventurers stalk forgotten halls
  deep underground in the hopes of finding their fortunes. Armies march in war ravaged lands for dominion
  over the scraps of land that remain untouched. Worst of all is the horror that lurks in the shadows, eternally
  waiting for the time when they may consume all civilization. You may enter this world if you dare, but
  be on your guard for the darkness awaits all!"
end

def game_start
  puts "                                                                        "
  puts "                                                                        "
  puts "In the darkness you awaken. You find yourself in a strange place that is
  both familiar and unfamiliar in equal measure. Your arms feel haggard and sore
  and as you look around you notice shackles on the wall that have been somehow destroyed.
  With your arms free you stand up and really look at your surroundings."
  puts "                                                                        "
  puts "The room is a large dimly lit chamber. Along the walls you notice sconces
  containing torches. The light from these torches is barely strong enough to illuminate
  the closest parts of this room."
  puts "                                                                        "
  puts "Along the opposite wall to the North you see a wooden door, that has a barred porthole.
  To your right on the eastern wall you see what appears to be a man who is shackled to the wall.
  To the left on the western part of the room there is just a wall with a torch."
  puts "                                                                        "
  puts "What would you like to do now?"
  initial_choice = gets.chomp
  level_1_choices = Level1StartRoomChoices.new.first_choice(initial_choice)
  # level_1_choices.first_choice(initial_choice)
  puts `clear`

  # while true
  #   byebug
  #   puts "What would you like to do now?"
  #   choice = gets.chomp
  #   if choice === "North"
  #     puts choice
  #     break
  #   elsif choice === "West"
  #     puts choice
  #     break
  #   elsif choice === "East"
  #     puts choice
  #   else
  #     puts "Invalid choice, try again!"
  #   end
  # end
end

def app
  play_music

  title
  world_tag
  game_start
end

app
