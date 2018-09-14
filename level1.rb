require 'artii'


def title
    puts ('  ___ ___        .__ ___.                    .___')
    puts (' /   |   \_____  |  |\_ |__   ___________  __| _/')
    puts ('/    ~    \__  \ |  | | __ \_/ __ \_  __ \/ __ | ')
    puts ('\    Y    // __ \|  |_| \_\ \  ___/|  | \/ /_/ | ')
    puts (' \___|_  /(____  /____/___  /\___  >__|  \____ | ')
    puts ('      \/      \/         \/     \/           \/  ')
    puts ('###########################################################################################')
    puts ('###########################################################################################')
    puts ('###########################################################################################')
    a = Artii::Base.new :font => 'slant'
    puts (a.asciify('Journey Through The Darkness'))
    puts ('###########################################################################################')
    puts ('###########################################################################################')
    puts ('###########################################################################################')
  end

# This is the explanation of the game. Mood setting tag that
# will be before every game set in the halberd universe
def world_tag
  puts "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
  labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
  esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
  culpa qui officia deserunt mollit anim id est laborum."
end


def app
  title
  world_tag
end

app
