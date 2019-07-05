########### GAME BEGIN #########################################################
def beginning
  specific_spacer(2)
  puts "In the darkness you awaken. You find yourself in a strange place that is
  both familiar and unfamiliar in equal measure. Your arms feel haggard and sore
  and as you look around you notice shackles on the wall that have been somehow destroyed.
  With your arms free you stand up and really look at your surroundings."
  specific_spacer(2)
  puts "The room is a large dimly lit chamber. Along the walls you notice sconces
  containing torches. The light from these torches is barely strong enough to illuminate
  the closest parts of this room."
  specific_spacer(2)
  puts "Along the opposite wall to the North you see a wooden door, that has a barred porthole.
  To your right on the eastern wall you see what appears to be a man who is shackled to the wall.
  To the left on the western part of the room there is just an empty wall."
  specific_spacer(3)
end
########### GAME BEGIN #########################################################
def into_dungeon_hall_one
  scroll_text ("You leave the room. You are in a dungeon hallway.\n")
  scroll_text ("On the floor lies the body of a masked man\n")
  scroll_text ("He is dead and has several large gashes throughout his body.\n")
  scroll_text ("It seems the door was blown open using some type of dark paste.\n")
  scroll_text ("Further down in the dungeon you can hear the sounds of fighting\n")
end
