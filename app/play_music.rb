
def play_music
    pid = fork{exec "afplay", "../Halberd_theme.m4a"}
end
