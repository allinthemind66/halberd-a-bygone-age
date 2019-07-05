class StartRoom < Room

  # Need to see what can be abstracted out, see what isnt DRY as well.
  
  attr_accessor :quit, :exit

  def entrance
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

  def choices(player)
    player.update(
      strength: 3, 
      toughness: 3, 
      attacks: 1, 
      initiative: 3,
      wounds: 3, 
      armour_save: 0, 
      leadership: 7, 
      encumberance: 100, 
      gold: 0
    )

    @door_locked = true

    while !@quit
      puts "What would you like to do now?"
      choice = gets.chomp.downcase

      case choice
      when 'forward', 'north', 'go north', 'go forward'
        scroll_text("You come upon a closed door.")
        specific_spacer(2)

      when 'west', 'left', 'go left', 'go west'
        if player.has_item?("torch") || @floor.include?("torch")
          scroll_text ("You come upon an empty wall where a torch was.")
        else
          scroll_text ("There is nothing but a wall with a torch.")
        end
        specific_spacer(2)

      when 'east', 'right', 'go east', 'go right'
        scroll_text ("You look to your right and see a man shackled to the wall. Maybe you should go talk to him...")
        specific_spacer(2)

      when 'south', 'go south', 'back', 'go back'
        scroll_text ("This part of the room has broken shackles on the wall... Best get moving.")
        specific_spacer(2)

      when 'help', 'commands'
        clear
        puts help

      when 'inventory'
        clear
        player.display_inventory

      when 'talk to man', 'talk', 'man', 'talk man'
        if @door_locked === true
        scroll_text ("You walk over to the man and ask him his name. ")
        sleep(0.5)
        scroll_text (" He responds, hesitantly and with some surprise,\n")
        sleep(0.5)
        scroll_text (" What?!\n")
        sleep(0.2)
        scroll_text (" You do not recognize me?\n")
        sleep(0.8)
        scroll_text (" Its me, Ragnir! We've been shackled here for years!\n")
        sleep(0.3)
        scroll_text (" You've finally lost your mind, you poor wretch!\n")
        sleep(1)
        scroll_text (" Wait...")
        sleep(1.5)
        scroll_text  (" How did you undo your shackles?!\n")
        sleep(0.5)
        scroll_text  ("At this moment you hear a loud boom and the door unhinges slightly.\n")
        puts "**BOOM**".red
        fork{exec "afplay", "../../../lib/sounds/Explosion_2.wav"}
        @door_locked = false
        sleep(1)

        scroll_text ("You hear a faint voice mumble '.....My liege...escape while theres still time...
        uurghhh...")
      else
        scroll_text ("Theres our chance for freedom! Go and get help!\n")
        scroll_text ("When you find a way to break my shackles... don't forget old Ragnir!")
      end
        specific_spacer(2)


      when "open door", "Open Door", "door", "Door", "open", "Open"
        if @door_locked === false
          scroll_text ("You open the door")
          specific_spacer(2)
        else
          scroll_text ("You can't open the door. It's locked from the outside!")
          specific_spacer(2)
        end

      when 'leave room', 'leave'
        if @door_locked === false
          specific_spacer(2)
          # fork{ exec  "killall", "afplay"}
          break
        else
          scroll_text ("You can't open the door. It's locked from the outside!")
          specific_spacer(2)
        end

      when 'torch'
        if player.has_item?("torch")
          scroll_text ('You look at the torch in your hand. It burns strongly... for now')
          specific_spacer(2)
        elsif !@items.include?("torch")
          scroll_text ("The torch is now on the floor. It no longer burns as brightly.")
          specific_spacer(2)
        else 
          scroll_text ('The torch sits inside a sconce. It casts a pool of light around it.')
          specific_spacer(2)
          scroll_text ('Maybe it would be useful?')
          specific_spacer(2)
        end
        
      when 'grab torch', 'take torch'
        if player.encumbered?(2) || player.items.count == 2
          scroll_text ("You can not carry any more items!")
          specific_spacer(2)
        else 
          if player.has_item?("torch")
            scroll_text ("You have already taken the torch")
            specific_spacer(2)

          elsif @floor.include?("torch")

            player.add_item("torch", 5, 1, 1)
            scroll_text "You pick the torch up from off the floor."

            @floor.select! {|item| item != "torch"}
            specific_spacer(2)

          else
            scroll_text ("You take the torch from off the wall, it forms a pool of light around you.")
            # name, weight, price, weapon_strength
            player.add_item("torch", 5, 1, 1)
            @items.select! {|item| item != "torch"}
            specific_spacer(2)
          end
        end

      when 'drop item', 'drop'
        if player.items.count == 0
          scroll_text ("You have nothing to drop.")
          specific_spacer(2)
        else
          specific_spacer(2)
           drop_prompt = TTY::Prompt.new
           item_to_drop = drop_prompt.select("What would you like to drop?", marker: @sun_marker) do |menu|
             player.items.each do |item|
               menu.choice "#{item.name}"
             end
           end

           player.drop_item(item_to_drop)
           @floor << item_to_drop
        end
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
