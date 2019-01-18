require 'artii'
require './player.rb'
require 'byebug'

############### OPENING SEQUENCE ################################################

def title
    puts ('   ▄█    █▄       ▄████████  ▄█       ▀█████████▄     ▄████████    ▄████████ ████████▄  ')
    sleep(0.2)
    puts ('  ███    ███     ███    ███ ███         ███    ███   ███    ███   ███    ███ ███   ▀███ ')
    sleep(0.2)
    puts ('  ███    ███     ███    ███ ███         ███    ███   ███    █▀    ███    ███ ███    ███ ')
    sleep(0.2)
    puts (' ▄███▄▄▄▄███▄▄   ███    ███ ███        ▄███▄▄▄██▀   ▄███▄▄▄      ▄███▄▄▄▄██▀ ███    ███ ')
    sleep(0.2)
    puts ('▀▀███▀▀▀▀███▀  ▀███████████ ███       ▀▀███▀▀▀██▄  ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ███    ███ ')
    sleep(0.2)
    puts ('  ███    ███     ███    ███ ███         ███    ██▄   ███    █▄  ▀███████████ ███    ███ ')
    sleep(0.2)
    puts ('  ███    ███     ███    ███ ███▌    ▄   ███    ███   ███    ███   ███    ███ ███   ▄███ ')
    sleep(0.2)
    puts('  ███    █▀      ███    █▀  █████▄▄██ ▄█████████▀    ██████████   ███    ███ ████████▀  ')
    sleep(0.2)
    puts('                            ▀                                     ███    ███            ')
    puts ('                                                                                           ')

puts ('▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒')
sleep(0.2)
puts ('▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒')
sleep(0.2)
puts ('▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░')
sleep(0.2)
puts ('░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░')
sleep(0.2)
puts (' ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒')
sleep(0.2)
puts ('▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒')
sleep(0.2)
puts ('▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░')
sleep(0.2)
puts ('░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░')
sleep(0.2)
puts (' ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░')
sleep(0.2)
puts (' ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░')

    sleep(0.3)
    puts ('                                                                                           ')
puts (' ▐▄▄▄      ▄• ▄▌▄▄▄   ▐ ▄ ▄▄▄ . ▄· ▄▌    ▄▄▄▄▄ ▄ .▄▄  ▄▄       ▄• ▄▌ ▄▄ •   ▄ .▄    ▄▄▄▄▄ ▄ .▄▄▄▄ .    ·▄▄▄▄   ▄▄▄· ▄▄▄  ▄ •▄  ▐ ▄ ▄▄▄ ..▄▄ · .▄▄ ·')
sleep(0.2)
puts ('  ·██▪     █▪██▌▀▄ █·•█▌▐█▀▄.▀·▐█▪██▌    •██  ██▪▐█  █ █·▪     █▪██▌▐█ ▀ ▪ ██▪▐█    •██  ██▪▐█▀▄.▀·    ██▪ ██ ▐█ ▀█ ▀▄ █·█▌▄▌▪•█▌▐█▀▄.▀·▐█ ▀. ▐█ ▀.')
sleep(0.2)
puts ('▪▄ ██ ▄█▀▄ █▌▐█▌▐▀▀▄ ▐█▐▐▌▐▀▀▪▄▐█▌▐█▪     ▐█.▪██▀▀▐ ▐▀▀▄  ▄█▀▄ █▌▐█▌▄█ ▀█▄ ██▀▐█     ▐█.▪██▀▐█▐▀▀▪▄    ▐█· ▐█▌▄█▀▀█ ▐▀▀▄ ▐▀▀▄·▐█▐▐▌▐▀▀▪▄▄▀▀▀█▄▄▀▀▀█▄')
sleep(0.2)
puts ('▐▌▐█▌▐█▌.▐▌▐█▄█▌▐█•█▌██▐█▌▐█▄▄▌ ▐█▀·.     ▐█▌·██  ▐ ▐█•█▌▐█▌.▐▌▐█▄█▌▐█▄▪▐█ ██▌▐▀     ▐█▌·██▌▐▀▐█▄▄▌    ██. ██ ▐█ ▪▐▌▐█•█▌▐█.█▌██▐█▌▐█▄▄▌▐█▄▪▐█▐█▄▪▐█')
sleep(0.2)
puts (' ▀▀▀• ▀█▄▀▪ ▀▀▀ .▀  ▀▀▀ █▪ ▀▀▀   ▀ •      ▀▀▀ ▀▀▀ ▀·.▀  ▀ ▀█▄▀▪ ▀▀▀ ·▀▀▀▀  ▀▀▀ ·     ▀▀▀ ▀▀▀ · ▀▀▀     ▀▀▀▀▀•  ▀  ▀ .▀  ▀·▀  ▀▀▀ █▪ ▀▀▀  ▀▀▀▀  ▀▀▀▀')
sleep(0.2)
puts ('                                                                                           ')
puts ('▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒')
sleep(0.2)
puts ('▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒▒██   ██▒')
sleep(0.2)
puts ('▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░▒▒ █ █ ▒░')
sleep(0.2)
puts ('░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░░░  █   ░')
sleep(0.2)
puts (' ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒  ░ █ █ ▒')
sleep(0.2)
puts ('▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒▒██▒ ▒██▒')
sleep(0.2)
puts ('▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░▒▒ ░ ░▓ ░')
sleep(0.2)
puts ('░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░░░   ░▒ ░')
sleep(0.2)
puts (' ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░')
sleep(0.2)
puts (' ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░   ░    ░')
    sleep(0.2)
  end



# This is the explanation of the game. Mood setting tag that
# will be before every game set in the halberd universe
def world_tag
  puts "                                                                        "
  puts "                                                                        "
  puts "In a grim and perlious world the darkness consumes all. Brave adventurers stalk forgotten halls
  deep underground for the slight chance to make their fortunes. Armies march in war ravaged lands for dominion
  over the scraps of land that remain unscared. Worst of all is the horror that lurks in the shadows, eternally
  waiting for the time when it will consume all civilization. Enter now into the world of Halberd..."
end
