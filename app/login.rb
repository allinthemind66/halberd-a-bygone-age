def login
  scroll_text("Welcome to the world of Halberd... Please enter your name")
  specific_spacer(1)
  name = gets.chomp
  @player = Player.find_or_create_by(name: name)
  clear
end
