require 'artii'
require './intro.rb'
require './level1_start_room_choices.rb'
require './input_choice.rb'
require './dungeon_hall.rb'
require './player.rb'
require 'byebug'


def play_music
    pid = fork{exec "afplay", "./music/Halberd_theme.m4a"}
end

########### GAME BEGIN #########################################################

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
end

def app
  @player = Player.new
  play_music
  title
  world_tag
  game_start
  level_1_choices = Level1StartRoomChoices.new
  level_1_choices.first_choice
  level_1_choices.quit ? return : dungeon_hall = DungeonHall.new
  dungeon_hall.choices
end

app
