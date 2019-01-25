

class InputChoice
  def hello
    puts "hello!"
  end
  def help
    # Using an array for these commands so we can just add to it here.
    directionals = ["Up", "Down", "left", "Right", "Forward", "Back", "North", "South", "East", "West"]
    actions = ["Talk", "Talk + Object", "Look", "Look + directional", "Search", "Search + Object" "Door", "Open Door", "Chest", "Open Chest"]
    game_commands = ["Map", "Save", "Quit", "Quit Game"]
    puts ('                                                             ')
    puts 'Some commands you can use:'.upcase
    puts '######################################################################################'
    puts 'Directional commands: ' + directionals.join(", ")
    puts '######################################################################################'
    puts 'Other Commands: ' + actions.join(", ")
    puts '######################################################################################'
    puts 'Game Commands: ' + game_commands.join(", ")
  end

  def scroll_text(text)
    text.each_char do |c|
      print c
      sleep (0.05)
    end
  end

  def new_line()
    puts "\n"
    puts "\n"
  end
end
