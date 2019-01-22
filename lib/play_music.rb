require 'byebug'

def play_music
    pid = fork{exec "afplay", "./music/Halberd_theme.m4a"}
end
