require 'artii'
require './level1_start_room_choices.rb'
require './input_choice.rb'
require './dungeon_hall.rb'
require './player.rb'
require 'byebug'

def play_music
    pid = fork{exec "afplay", "./music/Halberd_theme.m4a"}
end


def title
    puts ('  ___ ___        .__ ___.                    .___')
    sleep(0.2)
    puts (' /   |   \_____  |  |\_ |__   ___________  __| _/')
    sleep(0.2)
    puts ('/    ~    \__  \ |  | | __ \_/ __ \_  __ \/ __ | ')
    sleep(0.2)
    puts ('\    Y    // __ \|  |_| \_\ \  ___/|  | \/ /_/ | ')
    sleep(0.2)
    puts (' \___|_  /(____  /____/___  /\___  >__|  \____ | ')
    sleep(0.2)
    puts ('      \/      \/         \/     \/           \/  ')
    sleep(0.2)
    puts ('###########################################################################################')
    sleep(0.2)
    puts ('###########################################################################################')
    sleep(0.2)
    puts ('###########################################################################################')
    sleep(0.2)
    puts '       __                                     ________                           __       ________            ____             __                       '
    sleep(0.2)
    puts '      / /___  __  ___________  ___  __  __   /_  __/ /_  _________  __  ______ _/ /_     /_  __/ /_  ___     / __ \____ ______/ /______  ___  __________'
    sleep(0.2)
    puts ' __  / / __ \/ / / / ___/ __ \/ _ \/ / / /    / / / __ \/ ___/ __ \/ / / / __ `/ __ \     / / / __ \/ _ \   / / / / __ `/ ___/ //_/ __ \/ _ \/ ___/ ___/'
    sleep(0.2)
    puts '/ /_/ / /_/ / /_/ / /  / / / /  __/ /_/ /    / / / / / / /  / /_/ / /_/ / /_/ / / / /    / / / / / /  __/  / /_/ / /_/ / /  / ,< / / / /  __(__  )__  ) '
    sleep(0.2)
    puts '\____/\____/\__,_/_/  /_/ /_/\___/\__, /    /_/ /_/ /_/_/   \____/\__,_/\__, /_/ /_/    /_/ /_/ /_/\___/  /_____/\__,_/_/  /_/|_/_/ /_/\___/____/____/  '
    sleep(0.2)
    puts '                                 /____/                                /____/                                                                           '
    puts ('###########################################################################################')
    sleep(0.2)
    puts ('###########################################################################################')
    sleep(0.2)
    puts ('###########################################################################################')
    sleep(0.2)
  end

# This is the explanation of the game. Mood setting tag that
# will be before every game set in the halberd universe
def world_tag
  puts "                                                                        "
  puts "                                                                        "
  # sentence =
  puts "In a grim and perlious world the darkness consumes all. Brave adventurers stalk forgotten halls
  deep underground in the hopes of finding their fortunes. Armies march in war ravaged lands for dominion
  over the scraps of land that remain untouched. Worst of all is the horror that lurks in the shadows, eternally
  waiting for the time when they may consume all civilization. You may enter this world if you dare, but
  be on your guard for the darkness awaits all!"
  # sentence.each_char do |c|
  #   print c
  #   sleep(0.05)
  # end
  # puts "In a grim and perlious world the darkness consumes all. Brave adventurers stalk forgotten halls
  # deep underground in the hopes of finding their fortunes. Armies march in war ravaged lands for dominion
  # over the scraps of land that remain untouched. Worst of all is the horror that lurks in the shadows, eternally
  # waiting for the time when they may consume all civilization. You may enter this world if you dare, but
  # be on your guard for the darkness awaits all!"
end

def game_start
  puts "                                                                        "
  puts "                                                                        "
  puts "In the darkness you awaken. You find yourself in a strange place that is
  both familiar and unfamiliar in equal measure. Your arms feel haggard and sore
  and as you look around you notice shackles on the wall that have been somehow destroyed.
  With your arms free you stand up and really look at your surroundings."
  # .each_char do |c|
  #   print c
  #   sleep (0.05)
  # end
  puts "\n"
  puts "                                                                        "
  puts "The room is a large dimly lit chamber. Along the walls you notice sconces
  containing torches. The light from these torches is barely strong enough to illuminate
  the closest parts of this room."
  # .each_char do |c|
  #   print c
  #   sleep (0.05)
  # end
  puts "\n"
  puts "                                                                        "
  puts "Along the opposite wall to the North you see a wooden door, that has a barred porthole.
  To your right on the eastern wall you see what appears to be a man who is shackled to the wall.
  To the left on the western part of the room there is just an empty wall."
  # .each_char do |c|
  #   print c
  #   sleep (0.05)
  # end
  puts "                                                                        "
  puts "                                                                        "
  puts "                                                                        "
  level_1_choices = Level1StartRoomChoices.new
  level_1_choices.first_choice
end

def app
  @player = Player.new
  play_music
  title
  world_tag
  game_start
  dungeon_hall = DungeonHall.new
  dungeon_hall.choices
end

app
