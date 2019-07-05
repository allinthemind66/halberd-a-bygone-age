require_relative '../config/environment'
require_all 'app'


def app
  # title
  # world_tag
  login
  menu_choice = game_menu
  case menu_choice
  when "start"
    clear # ../app/text_formater
    # FIRST ROOM
    start_room = StartRoom.new(["torch"])
    start_room.entrance
    start_room.choices(@player)
    start_room.quit ? return : dungeon_hall_one = DungeonHallOne.new
    # FIRST HALLWAY
    dungeon_hall_one.entrance 
    dungeon_hall_one.choices(@player) 
  when "load"
    puts "COMING SOON"
  when "delete"
    puts "COMING SOON"
  end
end

app
