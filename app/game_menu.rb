def game_menu
  clear
    prompt = TTY::Prompt.new
    choice = prompt.select("Greetings #{@player.name}, make a selection:", marker: @sun_marker) do |menu|
      menu.choice 'Start a new game'
      menu.choice 'Load a game'
      menu.choice 'Delete a saved game'
      menu.choice 'Exit'
    end
  clear
  case choice
  when 'Start a new game'
    return "start"
  when 'Load a game'
    return "load"
  when 'Delete a saved game'
    return "delete"
  when 'Exit'
    good_bye
  else
    good_bye
  end
end
