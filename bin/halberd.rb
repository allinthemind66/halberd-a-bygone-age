require_relative '../config/environment'
require_all 'app'


def app
  # title # ../app/intro
  # world_tag # ../app/intro
  login # ../app/login
  menu_choice = game_menu # ../app/game_menu
  case menu_choice
  when "start"
    clear # ../app/text_formater
    beginning # ../app/transition_text
    start_room = StartRoom.new # ../app/levels/level_one/start_room
    start_room.first_choice(@player) # ../app/levels/level_one/start_room
    start_room.quit ? return : dungeon_hall_one = DungeonHallOne.new # ../app/levels/level_one/start_room
    into_dungeon_hall_one # ../app/levels/level_one/dungeon_hall_one
    dungeon_hall_one.choices(@player) # ../app/levels/level_one/dungeon_hall_one
  when "load"
    puts "COMING SOON"
  when "delete"
    puts "COMING SOON"
  end
end

app
