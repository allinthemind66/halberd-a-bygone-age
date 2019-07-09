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
    start_room.quit ? return : dungeon_hall_one = DungeonHallOne.new(["Short Sword", "12 Gold Coins", "Coil of Rope"])
    start_room.exit
    # FIRST HALLWAY
    dungeon_hall_one.entrance 
    dungeon_hall_one.choices(@player) 
    dungeon_hall_one.quit ? return : guard_room_a = GuardRoomA.new([])
    dungeon_hall_one.exit
    # GuardRoomA
    guard_room_a.choices(@player)
  when "load"
    puts "COMING SOON"
  when "delete"
    puts "COMING SOON"
  end
end

app
