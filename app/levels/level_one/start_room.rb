class StartRoom
  attr_accessor :quit, :exit

  def initialize
    @quit = false
    @exit = false
  end

  def first_choice(player)
    player.update(strength: 3, toughness: 3, attacks: 1, initiative: 3, wounds: 3, armour_save: 0, leadership: 7, encumberance: 100, gold: 0)
    @door_locked = true

    while !@quit
      puts "What would you like to do now?"
      choice = gets.chomp.downcase

      case choice
      when 'forward', 'north', 'go north', 'go forward'
        scroll_text("You come upon a closed door.")
        specific_spacer(2)

      when 'west', 'left', 'go left', 'go west'
       # BUG: Must use the active record methods, to find the associated item model
       binding.pry
        if player.items.include?("Torch")
          scroll_text ("You come upon an empty wall where a torch was.")
        else
          scroll_text("There is nothing but a wall with a torch.")
        end
        specific_spacer(2)

      when 'east', 'right', 'go east', 'go right'
        scroll_text("You look to your right and see a man shackled to the wall. Maybe you should go talk to him...")
        specific_spacer(2)

      when 'south', 'go south', 'back', 'go back'
        scroll_text("This part of the room has broken shackles on the wall... Best get moving.")
        specific_spacer(2)

      when 'help', 'commands'
        puts help

      when 'inventory'
        display_inventory

      when 'talk to man', 'talk', 'man', 'talk man'
        if @door_locked === true
        scroll_text("You walk over to the man and ask him his name. ")
        sleep(0.5)
        scroll_text(" He responds, hesitantly and with some surprise,\n")
        sleep(0.5)
        scroll_text(" What?!\n")
        sleep(0.2)
        scroll_text(" You do not recognize me?\n")
        sleep(0.8)
        scroll_text(" Its me, Ragnir! We've been shackled here for years!\n")
        sleep(0.3)
        scroll_text (" You've finally lost your mind, you poor wretch!\n")
        sleep(1)
        scroll_text(" Wait...")
        sleep(1.5)
        scroll_text(" How did you undo your shackles?!\n")
        sleep(0.5)
        scroll_text("At this moment you hear a loud boom and the door unhinges slightly.\n")
        puts "**BOOM**".red
        # fork{exec "afplay", "./sounds/Explosion_2.wav"}
        @door_locked = false
        sleep(1)

        scroll_text("You hear a faint voice mumble '.....My liege...escape while theres still time...
        uurghhh...")
      else
        scroll_text ("Theres our chance for freedom! Go and get help!\n")
        scroll_text ("When you find a way to break my shackles... don't forget old Ragnir!")
      end
        specific_spacer(2)


      when "open door", "Open Door", "door", "Door", "open", "Open"
        if @door_locked === false
          scroll_text("You open the door")
          specific_spacer(2)
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          specific_spacer(2)
        end

      when 'leave room', 'leave'
        if @door_locked === false
          specific_spacer(2)
          # fork{ exec  "killall", "afplay"}
          break
        else
          scroll_text("You can't open the door. It's locked from the outside!")
          specific_spacer(2)
        end

      when  'torch'
        
        scroll_text ('The torch sits inside a sconce. It casts a pool of light around it.')
        specific_spacer(2)
        scroll_text ('Maybe it would be useful?')
        specific_spacer(2)
        
      when 'grab torch', 'take torch'
        if player.has_item?("torch")
          scroll_text ("You have already taken the torch")
        else
          scroll_text ("You take the torch from off the wall, it forms a pool of light around you.")
          player.add_item("torch", 2, 1, 1)
          specific_spacer(2)
        end

      when 'drop item', 'drop'
        puts "WORK IN PROGRESS"
        # if Player.all.first.inventory.empty?
        #   scroll_text ("You have nothing to drop.")
        #   specific_spacer(2)
        # else
        #   scroll_text ("What would you like to drop?")
        #   specific_spacer(2)
        #   item = gets.chomp.downcase
        #   Player.all.first.inventory.map! do |inventory_item|
        #     if item == inventory_item.downcase
        #       Player.all.first.inventory.delete(inventory_item)
        #       scroll_text ("You drop the #{inventory_item}")
        #       specific_spacer(2)
        #     else
        #       scroll_text ('hmmm... You do not have that item.')
        #       specific_spacer(2)
        #       break
        #     end
        #   end
        # end
      when  'Hello'
        scroll_text ('A voice somewhere responds "Hi there."')
      when 'quit'
        puts "you are quiting. goodbye"
        @quit = true
        good_bye
        break
      else
        puts "Invalid choice, try again!"
      end
    end
    @exit
  end
end
