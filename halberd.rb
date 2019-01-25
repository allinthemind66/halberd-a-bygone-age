require 'artii'
require 'byebug'
require_relative 'lib/play_music.rb'
require_relative 'lib/intro.rb'
require_relative 'lib/game_start.rb'
require_relative 'lib/level1_start_room_choices.rb'
require_relative 'lib/input_choice.rb'
require_relative 'lib/dungeon_hall.rb'
require_relative 'lib/player.rb'


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
