class InputChoice
  def hello
    puts "hello!"
  end
  def help
    puts '##############################################################'
    puts 'Directional commands: Up, down, left, right, forward, behind'
    puts '##############################################################'
    puts 'Other Commands: Talk, Open Door, open chest'
    puts '##############################################################'
    puts 'Game Commands: Map, Save, Quit Game'
  end

  def scroll_text(text)
    text.each_char do |c|
      print c
      sleep (0.05)
    end
  end
end
